//
//  Textfield.swift
//  Hired Valley
//
//  Created by ellkaden on 12.09.2024.
//

import UIKit

class Textfield: UITextField {
    

    let button = UIButton(type: .custom)
    
    var isButtonVisible: Bool = false {
        didSet {
            button.isHidden = !isButtonVisible
            rightViewMode = isButtonVisible ? .always : .never
        }
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit(placeholder: "")
    }
    
    convenience init(placeholder: String) {
        self.init(frame: .zero)
        commonInit(placeholder: placeholder)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func commonInit(placeholder: String) {
        self.borderStyle = .roundedRect
        self.placeholder = placeholder
        //self.addDoneButtonOnKeyboard()
        self.textColor = .black
        
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.minimumLineHeight = 12
        paragraphStyle.maximumLineHeight = 12
        
        self.attributedPlaceholder = NSAttributedString(
            string: placeholder,
            attributes: [NSAttributedString.Key.foregroundColor: UIColor.appGray,
                         NSAttributedString.Key.font: UIFont.appFont(ofSize: 14, weight: .medium), NSAttributedString.Key.paragraphStyle: paragraphStyle]
        )
        self.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 12, height: self.frame.height))
        self.leftViewMode = .always
    }
    
    func configureButton() {
        let imageName = self.isSecureTextEntry ? "eye" : "eye"
        button.setImage(UIImage(named: imageName), for: .normal)
        button.addTarget(self, action: #selector(togglePasswordView), for: .touchUpInside)
        button.isHidden = !isButtonVisible
        self.rightView = button
        self.rightViewMode = .always
        self.addTarget(self, action: #selector(textFieldDidChange), for: .editingChanged)
    }

    @objc func togglePasswordView() {
        self.isSecureTextEntry.toggle()
        let imageName = self.isSecureTextEntry ? "eye" : "eye-slash"
        button.setImage(UIImage(named: imageName), for: .normal)
    }

    @objc func textFieldDidChange() {
        adjustButtonFrame()
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        adjustButtonFrame()
    }
    
    private func adjustButtonFrame() {
        if isButtonVisible {
            let buttonSize = CGSize(width: 30, height: 30)
            let buttonX = self.frame.width - buttonSize.width - 10
            button.frame = CGRect(x: buttonX, y: (self.frame.height - buttonSize.height) / 2, width: buttonSize.width, height: buttonSize.height)
        }
    }
    
    func showButton() {
        isButtonVisible = true
        configureButton()
    }

    func hideButton() {
        isButtonVisible = false
    }
}
