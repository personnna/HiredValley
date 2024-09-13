//
//  SettingsViewController.swift
//  Hired Valley
//
//  Created by ellkaden on 12.09.2024.
//

import UIKit
import SnapKit

class SettingsViewController: UIViewController, UIScrollViewDelegate {
    
    lazy var options: [[ProfileOptions]] = [
        [
            ProfileOptions(
                title: "Account",
                icon: .account,
                action: {}
            ),
            ProfileOptions(
                title: "Billing",
                icon: .billing,
                action: {}
            )
        ],
        [
            ProfileOptions(
                title: "Favorites",
                icon: .favorites,
                action: {}
            ),
            ProfileOptions(
                title: "Growth Goals",
                icon: .growth,
                action: {}
            )
        ],
        [
            ProfileOptions(
                title: "Notifications",
                icon: .notifications,
                action: {}
            ),
            ProfileOptions(
                title: "Language",
                icon: .language,
                action: {}
            ),
            ProfileOptions(
                title: "Dark/Light Mode  ",
                icon: .moon,
                action: {}
            )
        ],
        [
            ProfileOptions(
                title: "Help & Support",
                icon: .help,
                action: {}
            ),
            ProfileOptions(
                title: "Legal Information",
                icon: .info,
                action: {}
            ),
            ProfileOptions(
                title: "About Hired Valley",
                icon: .about,
                action: {}
            )
        ],
    ]
    
    private lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.backgroundColor = .black
        scrollView.showsVerticalScrollIndicator = false
        scrollView.delegate = self
        return scrollView
    }()
    
    private lazy var contentView: UIView = {
        let view = UIView()
        return view
    }()
    
    private lazy var accountView: UIView = {
        let view = UIView()
        view.backgroundColor = .appBlue30
        view.layer.cornerRadius = 16
        return view
    }()
    
    private lazy var avatarImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "Account")
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    private lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.text = "Yerkazhan"
        label.font = .appFont(ofSize: 18, weight: .extrabold)
        label.textColor = .white
        return label
    }()
    
    private lazy var emailLabel: UILabel = {
        let label = UILabel()
        label.text = "yerekezhan.zholdassova@gmail.com"
        label.font = .appFont(ofSize: 14, weight: .medium)
        label.textColor = .white
        return label
    }()
    
    private lazy var viewProfileButton: UIButton = {
        let button = UIButton()
        button.setTitle("View Profile", for: .normal)
        button.setTitleColor(.appPurple40, for: .normal)
        button.titleLabel?.font = .appFont(ofSize: 14, weight: .medium)
        return button
    }()
    
    private lazy var tableView: UITableView = {
        let tableView = SelfSizingTableView(frame: .zero, style: .grouped)
        tableView.backgroundColor = .clear
        tableView.delegate = self
        tableView.dataSource = self
//        tableView.register(ProfileTableViewCell.self, forCellReuseIdentifier: ProfileTableViewCell.identifier)
        tableView.separatorStyle = .none
        tableView.isScrollEnabled = false
        return tableView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .black
        setupViews()
        setupConstraints()
    }
    
    func setupViews() {
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        contentView.addSubview(accountView)
        accountView.addSubviews(avatarImage, nameLabel, emailLabel, viewProfileButton)
        
        let backButton = UIBarButtonItem(title: "", style: .plain, target: self, action: nil    )
        backButton.setBackgroundImage(UIImage(named: "backButton"), for: .normal, barMetrics: .default)
        navigationItem.setLeftBarButton(backButton, animated: false)
        
        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = UIColor.black
        appearance.titleTextAttributes = [.foregroundColor: UIColor.white]
        appearance.largeTitleTextAttributes = [.foregroundColor: UIColor.white]

        navigationController?.navigationBar.standardAppearance = appearance
        navigationController?.navigationBar.compactAppearance = appearance
        navigationController?.navigationBar.scrollEdgeAppearance = appearance
    
        if #available(iOS 15.0, *) {
            navigationController?.navigationBar.compactScrollEdgeAppearance = appearance
        }
        
        self.title = "Settings"

    }
    
    func setupConstraints() {
        scrollView.snp.makeConstraints { make in
            make.edges.equalTo(view.safeAreaLayoutGuide)
        }
        contentView.snp.makeConstraints { make in
            make.edges.equalTo(scrollView.contentLayoutGuide)
            make.width.equalTo(scrollView.frameLayoutGuide)
        }
        accountView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaInsets.top).offset(34)
            make.leading.equalToSuperview().offset(24)
            make.trailing.equalToSuperview().offset(-24)
            make.height.equalTo(112)
        }
        avatarImage.snp.makeConstraints { make in
            make.top.equalTo(accountView.snp.top).offset(24)
            make.leading.equalTo(accountView.snp.leading).offset(16)
        }
        nameLabel.snp.makeConstraints { make in
            make.top.equalTo(accountView.snp.top).offset(31)
            make.leading.equalTo(avatarImage.snp.trailing).offset(16)
        }
        emailLabel.snp.makeConstraints { make in
            make.top.equalTo(nameLabel.snp.bottom).offset(8)
            make.leading.equalTo(avatarImage.snp.trailing).offset(16)
        }
        viewProfileButton.snp.makeConstraints { make in
            make.top.equalTo(emailLabel.snp.bottom).offset(5)
            make.leading.equalTo(avatarImage.snp.trailing).offset(16)
        }
        
    }
    
    @objc func backButtonPressed() {
        navigationController?.popViewController(animated: true)
    }
    
}

extension SettingsViewController: UITableViewDataSource, UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        return options.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return options[section].count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ProfileTableViewCell", for: indexPath) as? ProfileTableViewCell else {
            fatalError("The dequeued cell is not an instance of RoundedTableViewCell or hasn't been registered with the table view.")
        }
        
        let option = options[indexPath.section][indexPath.row]
        
        //cell.configure(with: option.title, icon: option.icon, hideArrow: indexPath.section == tableView.numberOfSections - 1)
        
        if option.title == "Выйти" {
            //cell.setTitleColor(.appGray70)
        }
        
        //cell.adjustCellPadding(forTitle: option.title)
        
        return cell
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        UIView()
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return section == 0 ? .leastNormalMagnitude : 8
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        UIView()
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return .leastNormalMagnitude
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        options[indexPath.section][indexPath.row].action()
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if indexPath.section == tableView.numberOfSections - 1 {
            return
        }
        
        let cornerRadius: CGFloat = 20
        cell.backgroundColor = UIColor.clear
        let layer: CAShapeLayer = CAShapeLayer()
        let path: CGMutablePath = CGMutablePath()
        let bounds: CGRect = cell.bounds.insetBy(dx: 1, dy: 1)
        
        if indexPath.row == 0 && indexPath.row == tableView.numberOfRows(inSection: indexPath.section) - 1 {
            path.__addRoundedRect(transform: nil, rect: bounds, cornerWidth: cornerRadius, cornerHeight: cornerRadius)
        } else if indexPath.row == 0 {
            path.move(to: CGPoint(x: bounds.minX, y: bounds.maxY))
            path.addArc(tangent1End: CGPoint(x: bounds.minX, y: bounds.minY), tangent2End: CGPoint(x: bounds.midX, y: bounds.minY), radius: cornerRadius)
            path.addArc(tangent1End: CGPoint(x: bounds.maxX, y: bounds.minY), tangent2End: CGPoint(x: bounds.maxX, y: bounds.midY), radius: cornerRadius)
            path.addLine(to: CGPoint(x: bounds.maxX, y: bounds.maxY))
        } else if indexPath.row == tableView.numberOfRows(inSection: indexPath.section) - 1 {
            path.move(to: CGPoint(x: bounds.minX, y: bounds.minY))
            path.addArc(tangent1End: CGPoint(x: bounds.minX, y: bounds.maxY), tangent2End: CGPoint(x: bounds.midX, y: bounds.maxY), radius: cornerRadius)
            path.addArc(tangent1End: CGPoint(x: bounds.maxX, y: bounds.maxY), tangent2End: CGPoint(x: bounds.maxX, y: bounds.midY), radius: cornerRadius)
            path.addLine(to: CGPoint(x: bounds.maxX, y: bounds.minY))
        } else {
            path.addLines(between: [CGPoint(x: bounds.minX, y: bounds.minY), CGPoint(x: bounds.minX, y: bounds.maxY)])
            path.addLines(between: [CGPoint(x: bounds.maxX, y: bounds.minY), CGPoint(x: bounds.maxX, y: bounds.maxY)])
        }
        
        layer.path = path
        layer.strokeColor = UIColor.white.cgColor
        layer.lineWidth = 2
        layer.fillColor = UIColor.white.cgColor
        
        let testView: UIView = UIView(frame: bounds)
        testView.layer.insertSublayer(layer, at: 0)
        testView.backgroundColor = UIColor.clear
        cell.backgroundView = testView
    }
}
