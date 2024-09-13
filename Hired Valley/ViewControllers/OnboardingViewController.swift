//
//  OnboardingViewController.swift
//  Hired Valley
//
//  Created by ellkaden on 10.09.2024.
//

import UIKit
import SnapKit

class OnboardingViewController: UIViewController {
     private lazy var logoImage: UIImageView = {
         let image = UIImageView()
         image.image = UIImage(named: "LOGO")
         image.contentMode = .scaleAspectFill
         return image
     }()

     private lazy var signUpButton: UIButton = {
         let button = UIButton()
         button.setTitle("I am new here", for: .normal)
         button.setTitleColor(.white, for: .normal)
         button.layer.cornerRadius = 24
         button.clipsToBounds = true
         button.titleLabel?.font = .appFont(ofSize: 18, weight: .extrabold)
         button.addTarget(self, action: #selector(openSignUpTapped), for: .touchUpInside)
         return button
     }()
     
     private lazy var loginButton: UIButton = {
         let button = UIButton()
         button.setTitle("Log In", for: .normal)
         button.setTitleColor(.white, for: .normal)
         button.layer.cornerRadius = 24
         button.layer.borderWidth = 1
         button.layer.borderColor = UIColor.white.cgColor
         button.titleLabel?.font = .appFont(ofSize: 18, weight: .regular)
         button.backgroundColor = .clear
         return button
     }()
     
     override func viewDidLoad() {
         super.viewDidLoad()
         
         navigationItem.hidesBackButton = true
         
         view.setGradientBackground(
             purpleColors: [UIColor.appPurple10.cgColor, UIColor.appPurple20.cgColor],
             blackColors: [UIColor.appBlack10.cgColor, UIColor.black.cgColor]
         )
         
         setupViews()
         setupConstraints()
         
         applyGradientToButton(button: signUpButton)
         
         navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
         navigationController?.navigationBar.shadowImage = UIImage()
         navigationController?.navigationBar.isTranslucent = true
     }
     
     func setupViews() {
         view.addSubviews(logoImage, loginButton, signUpButton)
     }
     
     func setupConstraints() {
         logoImage.snp.makeConstraints { make in
             make.top.equalToSuperview().offset(264)
             make.centerX.equalToSuperview()
             make.height.equalTo(56)
         }
         
         loginButton.snp.makeConstraints { make in
             make.bottom.equalToSuperview().inset(95)
             make.centerX.equalToSuperview()
             make.height.equalTo(56)
             make.leading.equalToSuperview().offset(23)
             make.trailing.equalToSuperview().inset(23)
         }
         
         signUpButton.snp.makeConstraints { make in
             make.bottom.equalTo(loginButton.snp.top).offset(-32)
             make.centerX.equalToSuperview()
             make.height.equalTo(56)
             make.leading.equalToSuperview().offset(23)
             make.trailing.equalToSuperview().inset(23)
         }
     }
     
     func applyGradientToButton(button: UIButton) {
         let gradientLayer = CAGradientLayer()
         gradientLayer.colors = [UIColor.appBlue10.cgColor, UIColor.appPurple30.cgColor]
         gradientLayer.startPoint = CGPoint(x: 0, y: 0.5)
         gradientLayer.endPoint = CGPoint(x: 1, y: 0.5)
         
         gradientLayer.frame = button.bounds
         gradientLayer.cornerRadius = button.layer.cornerRadius
         
         button.layer.insertSublayer(gradientLayer, at: 0)

         button.layoutIfNeeded()
         gradientLayer.frame = button.bounds
     }
     
     override func viewDidLayoutSubviews() {
         super.viewDidLayoutSubviews()

         signUpButton.layer.sublayers?.first(where: { $0 is CAGradientLayer })?.frame = signUpButton.bounds
         
         if let gradientLayer = view.layer.sublayers?.first as? CAGradientLayer {
             gradientLayer.frame = view.bounds
         }
     }
    
    @objc private func openSignUpTapped() {
        let notificationViewController = RegisterViewController()
        if let navigator = self.navigationController {
            navigator.pushViewController(notificationViewController, animated: true)
        } else {
            print("NavigationController is nil")
        }
    }
}
