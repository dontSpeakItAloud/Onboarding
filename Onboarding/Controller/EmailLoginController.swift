//
//  EmailLoginController.swift
//  Onboarding
//
//  Created by Rodion Kuskov on 2/20/20.
//  Copyright © 2020 Rodion Kuskov. All rights reserved.
//

import Foundation
import UIKit
import SnapKit

class EmailLoginController: UIViewController {
    
    // MARK:- UI Components
    private lazy var writeEmailLabel: UILabel = {
        let label = UILabel()
        label.text = "write your email".uppercased()
        label.font = .avenirRegular(size: 24)
        label.textColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        return label
    }()
    
    private lazy var belowLabel: UILabel = {
        let label = UILabel()
        label.text = "below".uppercased()
        label.font = .avenirDemiBold(size: 46)
        label.textColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        return label
    }()
    
    private lazy var emailTextField: LoginTextField = {
        let field = LoginTextField()
        field.configure(with: .email)
        field.addTarget(self, action: #selector(validateUserInput), for: .editingChanged)
        return field
    }()
    
    private lazy var passowrdTextField: LoginTextField = {
        let field = LoginTextField()
        field.configure(with: .password)
        field.addTarget(self, action: #selector(validateUserInput), for: .editingChanged)
        return field
    }()
    
    private lazy var willNotShareLabel: UILabel = {
        let label = UILabel()
        label.text = "I will not share your email to anybody"
        label.font = .avenirRegular(size: 10)
        label.textColor = .grayColor
        return label
    }()
    
    private lazy var signInButton: UIButton = {
        let button = UIButton()
        button.isEnabled = false
        button.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        button.layer.cornerRadius = 5
        button.isUserInteractionEnabled = false
        button.setTitle("Sign in", for: .normal)
        button.titleLabel?.font = .systemMedium(size: 14.5)
        button.setTitleColor(.mainBackgroundColor, for: .normal)
        button.setTitleColor(UIColor.mainBackgroundColor.withAlphaComponent(0.6), for: .disabled)
        button.addTarget(self, action: #selector(onSignInAction), for: .touchUpInside)
        return button
    }()
    
    private lazy var forgotPasswordLabel: UILabel = {
        let label = UILabel()
        let underlineAttribute = [
                NSAttributedString.Key.underlineStyle: NSUnderlineStyle.single.rawValue,
                NSAttributedString.Key.font : UIFont.avenirRegular(size: 10)
            ]  as [NSAttributedString.Key : Any]

        let underlineAttributedString = NSAttributedString(string: "Forgot password?", attributes: underlineAttribute)
        label.attributedText = underlineAttributedString
        return label
    }()
    
    // MARK:- Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
    }
    
    // MARK:- Initial setup
    private func configure() {
        addSubviews()
        addGestures()
        view.backgroundColor = .mainBackgroundColor
    }
    
    private func addGestures() {
        let dismissGesture = UITapGestureRecognizer(target: self, action: #selector(onDismissKeyboard))
        view.addGestureRecognizer(dismissGesture)
        
        let forgotPasswordGesture = UITapGestureRecognizer(target: self, action: #selector(onForgotPasswordAction))
        forgotPasswordLabel.addGestureRecognizer(forgotPasswordGesture)
    }
    
    private func addSubviews() {
        view.addSubview(writeEmailLabel)
        writeEmailLabel.snp.makeConstraints { make in
            make.top.equalTo(view.snp.top).offset(50)
            make.leading.equalToSuperview().offset(25)
            make.trailing.equalToSuperview()
            make.height.equalTo(30)
        }
        
        view.addSubview(belowLabel)
        belowLabel.snp.makeConstraints { make in
            make.top.equalTo(writeEmailLabel.snp.bottom)
            make.leading.equalTo(writeEmailLabel.snp.leading)
            make.height.equalTo(60)
        }

        view.addSubview(emailTextField)
        emailTextField.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.bottom.equalTo(view.snp.centerY).offset(-30)
            make.width.equalToSuperview().dividedBy(1.25)
            make.height.equalTo(40)
        }

        view.addSubview(passowrdTextField)
        passowrdTextField.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(emailTextField.snp.bottom).offset(15)
            make.width.equalToSuperview().dividedBy(1.25)
            make.height.equalTo(40)
        }

        view.addSubview(willNotShareLabel)
        willNotShareLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(passowrdTextField.snp.bottom).offset(5)
        }

        view.addSubview(signInButton)
        signInButton.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(willNotShareLabel.snp.bottom).offset(75)
            make.width.equalTo(210)
            make.height.equalTo(40)
        }

        view.addSubview(forgotPasswordLabel)
        forgotPasswordLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(signInButton.snp.bottom).offset(15)
        }
    }
    
    // MARK:- Selectors
    @objc func onSignInAction() {}
    @objc func onForgotPasswordAction() {}
    
    @objc func onDismissKeyboard() {
        view.endEditing(true)
    }

    @objc func validateUserInput() {
        let emailIsValid = EmailVerification.isValid(emailTextField.text)
        let passwordIsValid = PasswordVerification.isValid(passowrdTextField.text)

        signInButton.isEnabled = emailIsValid && passwordIsValid
        signInButton.isUserInteractionEnabled = emailIsValid && passwordIsValid
    }
}
