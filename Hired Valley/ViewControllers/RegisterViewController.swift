//
//  RegisterViewController.swift
//  Hired Valley
//
//  Created by ellkaden on 10.09.2024.
//

import UIKit

class RegisterViewController: UIViewController {
    
    private lazy var logoImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "logoSmall")
        image.contentMode = .scaleAspectFill
        return image
    }()
    
    private lazy var signUpTitle: UILabel = {
        let label = UILabel()
        label.text = "Sign Up"
        label.font = .appFont(ofSize: 24, weight: .extrabold)
        label.textColor = .white
        return label
    }()
    
    private lazy var firstNameLabel: UILabel = {
        let label = UILabel()
        label.text = "Name"
        label.font = .appFont(ofSize: 14, weight: .medium)
        label.textColor = .appWhite72
        return label
    }()

    let firstNameTextField = Textfield(placeholder: "Name")
    
    private lazy var emailAdressLabel: UILabel = {
        let label = UILabel()
        label.text = "Email address"
        label.font = .appFont(ofSize: 14, weight: .medium)
        label.textColor = .appWhite72
        return label
    }()

    let emailAdressTextField = Textfield(placeholder: "Email address")
    
    private lazy var passwordLabel: UILabel = {
        let label = UILabel()
        label.text = "Password"
        label.font = .appFont(ofSize: 14, weight: .medium)
        label.textColor = .appWhite72
        return label
    }()

    let passwordTextField = Textfield(placeholder: "Password")
    
    private lazy var signUpButton: UIButton = {
        let button = UIButton()
        button.setTitle("Sign up with Email", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 24
        button.clipsToBounds = true
        button.titleLabel?.font = .appFont(ofSize: 18, weight: .extrabold)
        button.addTarget(self, action: #selector(openSignUpTapped), for: .touchUpInside)
        return button
    }()
    
    private lazy var googleButton: UIButton = {
        let button = UIButton()
        button.setTitle("Continue with Google", for: .normal)
        button.setTitleColor(.appGray20, for: .normal)
        button.backgroundColor = .white
        button.layer.cornerRadius = 24
        button.clipsToBounds = true
        button.titleLabel?.font = .appFont(ofSize: 18, weight: .extrabold)
        return button
    }()
    
    private lazy var orLabel: UILabel = {
        let label = UILabel()
        label.text = "or"
        label.font = .appFont(ofSize: 16, weight: .semibold)
        label.textColor = .white
        return label
    }()
    
    private lazy var facebookButton: UIButton = {
        let button = UIButton()
        button.setTitle("Continue with Facebook", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .appBlue20
        button.layer.cornerRadius = 24
        button.clipsToBounds = true
        button.titleLabel?.font = .appFont(ofSize: 18, weight: .extrabold)
        return button
    }()
    
    private lazy var appleButton: UIButton = {
        let button = UIButton()
        button.setTitle("Continue with Apple", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .appBlack30
        button.layer.cornerRadius = 24
        button.clipsToBounds = true
        button.titleLabel?.font = .appFont(ofSize: 18, weight: .extrabold)
        return button
    }()
    
    private lazy var haveAccountView = {
        let view = UIView()
        return view
    }()
    
    private lazy var haveAccountLabel: UILabel = {
        let label = UILabel()
        label.text = "Already have an account?"
        label.font = .appFont(ofSize: 16, weight: .semibold)
        label.textColor = .white
        return label
    }()
    
    private lazy var loginButton: UIButton = {
        let button = UIButton()
        button.setTitle("Log in", for: .normal)
        button.setTitleColor(.appPurple40, for: .normal)
        button.titleLabel?.font = .appFont(ofSize: 16, weight: .semibold)
       // button.tintColor = .clear
        return button
    }()
    
    private lazy var agreementView: UIView = {
        let view = UIView()
        return view
    }()
    
    private lazy var agreementLabel: UILabel = {
        let label = UILabel()
        label.text = "By continuing, you agree to our"
        label.font = .appFont(ofSize: 12, weight: .extrabold)
        label.textColor = .appWhite64
        return label
    }()
    
    private lazy var privacyButton: UIButton = {
        let button = UIButton()
        button.setTitle("Privacy Policy", for: .normal)
        button.setTitleColor(.appPurple50, for: .normal)
        button.titleLabel?.font = .appFont(ofSize: 12, weight: .semibold)
        return button
    }()
    
    private lazy var andLabel: UILabel = {
        let label = UILabel()
        label.text = "and"
        label.font = .appFont(ofSize: 12, weight: .extrabold)
        label.textColor = .appWhite64
        return label
    }()
    
    private lazy var termsButton: UIButton = {
        let button = UIButton()
        button.setTitle("Terms of Use", for: .normal)
        button.setTitleColor(.appPurple50, for: .normal)
        button.titleLabel?.font = .appFont(ofSize: 12, weight: .semibold)
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.hidesBackButton = true
        
        view.setGradientBackground(
            purpleColors: [UIColor.appPurple10.cgColor, UIColor.appPurple20.cgColor],
            blackColors: [UIColor.appBlack10.cgColor, UIColor.black.cgColor]
        )
        
        setupView()
        setupConstraints()
        applyGradientToButton(button: signUpButton)
        
        passwordTextField.showButton()

    }
    
    func setupView() {
        view.addSubviews(logoImage, signUpTitle, firstNameTextField, firstNameLabel, emailAdressLabel, emailAdressTextField, passwordLabel, passwordTextField, signUpButton, orLabel, googleButton, facebookButton, appleButton, haveAccountView)
        haveAccountView.addSubviews(haveAccountLabel, loginButton, agreementView)
        agreementView.addSubviews(agreementLabel, privacyButton, andLabel, termsButton)
        
    }
    func setupConstraints(){
        logoImage.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(67)
            make.centerX.equalToSuperview()
            make.height.equalTo(35)
        }
        signUpTitle.snp.makeConstraints { make in
            make.top.equalTo(logoImage.snp.bottom).offset(16)
            make.centerX.equalToSuperview()
        }
        firstNameLabel.snp.makeConstraints { make in
            make.top.equalTo(signUpTitle.snp.bottom).offset(24)
            make.leading.equalToSuperview().offset(26)
        }
        firstNameTextField.snp.makeConstraints { make in
            make.top.equalTo(firstNameLabel.snp.bottom).offset(2)
            make.centerX.equalToSuperview()
            make.height.equalTo(42)
            make.leading.equalToSuperview().offset(24)
            make.trailing.equalToSuperview().offset(-24)
        }
        emailAdressLabel.snp.makeConstraints { make in
            make.top.equalTo(firstNameTextField.snp.bottom).offset(16)
            make.leading.equalToSuperview().offset(26)
        }
        emailAdressTextField.snp.makeConstraints { make in
            make.top.equalTo(emailAdressLabel.snp.bottom).offset(2)
            make.centerX.equalToSuperview()
            make.height.equalTo(42)
            make.leading.equalToSuperview().offset(24)
            make.trailing.equalToSuperview().offset(-24)
        }
        passwordLabel.snp.makeConstraints { make in
            make.top.equalTo(emailAdressTextField.snp.bottom).offset(16)
            make.leading.equalToSuperview().offset(26)
        }
        passwordTextField.snp.makeConstraints { make in
            make.top.equalTo(passwordLabel.snp.bottom).offset(2)
            make.centerX.equalToSuperview()
            make.height.equalTo(42)
            make.leading.equalToSuperview().offset(24)
            make.trailing.equalToSuperview().offset(-24)
        }
        signUpButton.snp.makeConstraints { make in
            make.top.equalTo(passwordTextField.snp.bottom).offset(48)
            make.centerX.equalToSuperview()
            make.leading.equalToSuperview().offset(24)
            make.trailing.equalToSuperview().offset(-24)
            make.height.equalTo(48)
        }
        orLabel.snp.makeConstraints { make in
            make.top.equalTo(signUpButton.snp.bottom).offset(16)
            make.centerX.equalToSuperview()
        }
        googleButton.snp.makeConstraints { make in
            make.top.equalTo(orLabel.snp.bottom).offset(16)
            make.centerX.equalToSuperview()
            make.leading.equalToSuperview().offset(24)
            make.trailing.equalToSuperview().offset(-24)
            make.height.equalTo(48)
        }
        facebookButton.snp.makeConstraints { make in
            make.top.equalTo(googleButton.snp.bottom).offset(16)
            make.centerX.equalToSuperview()
            make.leading.equalToSuperview().offset(24)
            make.trailing.equalToSuperview().offset(-24)
            make.height.equalTo(48)
        }
        appleButton.snp.makeConstraints { make in
            make.top.equalTo(facebookButton.snp.bottom).offset(16)
            make.centerX.equalToSuperview()
            make.leading.equalToSuperview().offset(24)
            make.trailing.equalToSuperview().offset(-24)
            make.height.equalTo(48)
        }
        haveAccountView.snp.makeConstraints { make in
            make.top.equalTo(appleButton.snp.bottom).offset(24)
            make.centerX.equalToSuperview()
        }
        haveAccountLabel.snp.makeConstraints { make in
            make.top.equalTo(haveAccountView.snp.top)
            make.leading.equalTo(haveAccountView)
        }
        loginButton.snp.makeConstraints { make in
            make.leading.equalTo(haveAccountLabel.snp.trailing).offset(8)
            make.top.equalTo(haveAccountView.snp.top).offset(-6)
            make.trailing.equalTo(haveAccountView)
        }
        agreementView.snp.makeConstraints { make in
            make.top.equalTo(haveAccountView.snp.bottom).offset(32)
            make.centerX.equalToSuperview()
        }
        agreementLabel.snp.makeConstraints { make in
            make.top.equalTo(agreementView.snp.top)
            make.centerX.equalTo(agreementView)
        }
        privacyButton.snp.makeConstraints { make in
            make.top.equalTo(agreementLabel.snp.bottom).offset(-4)
            make.leading.equalTo(agreementView.snp.leading)
        }
        andLabel.snp.makeConstraints { make in
            make.top.equalTo(agreementLabel.snp.bottom).offset(2)
            make.leading.equalTo(privacyButton.snp.trailing).offset(2)
        }
        termsButton.snp.makeConstraints { make in
            make.top.equalTo(agreementLabel.snp.bottom).offset(-4)
            make.leading.equalTo(andLabel.snp.trailing).offset(2)
            make.trailing.equalTo(agreementView)
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
    
    @objc private func openSignUpTapped() {
        let notificationViewController = SettingsViewController()
        if let navigator = self.navigationController {
            navigator.pushViewController(notificationViewController, animated: true)
        } else {
            print("NavigationController is nil")
        }
    }
    
}
