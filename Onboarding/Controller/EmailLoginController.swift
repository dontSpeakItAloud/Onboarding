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

class EmailLoginController: UIViewController, UITextFieldDelegate {
    
    // MARK:- UI Components
    private var onKeyboardShowConstraint = CGFloat()
    private var keyboardHeight: CGFloat = 0
    private var signInTopConstraint = NSLayoutConstraint()
    private var containerTopConstraint = NSLayoutConstraint()

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
    
    private lazy var containerView: UIView = {
        let view = UIView()
        view.backgroundColor = .clear
        return view
    }()
    
    private lazy var emailTextField: LoginTextField = {
        let field = LoginTextField()
        field.configure(with: .email)
        field.delegate = self
        field.addTarget(self, action: #selector(validateUserInput), for: .editingChanged)
        field.delegate = self
        field.becomeFirstResponder()
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
        label.textColor = .white
        return label
    }()
    
    // MARK:- Variables
    var navigation: NavigationService?
    private var isKeyboardHidden: Bool = true

    // MARK:- Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        removeObservers()
    }
    
    // MARK:- Initial setup
    private func configure() {
        addSubviews()
        addGestures()
        addObservers()
        view.backgroundColor = .mainBackgroundColor
    }
    
    private func addObservers() {
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
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

        view.addSubview(containerView)
        containerTopConstraint = containerView.topAnchor.constraint(equalTo: view.centerYAnchor, constant: -60)
        containerView.snp.makeConstraints { make in
            containerTopConstraint.isActive = true
            make.height.equalTo(280)
            make.centerX.equalToSuperview()
            make.width.equalToSuperview().dividedBy(1.25)
        }
        
        containerView.addSubview(emailTextField)
        emailTextField.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
            make.height.equalTo(40)
        }

        containerView.addSubview(passowrdTextField)
        passowrdTextField.snp.makeConstraints { make in
            make.top.equalTo(emailTextField.snp.bottom).offset(15)
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
            make.height.equalTo(40)
        }

        containerView.addSubview(willNotShareLabel)
        willNotShareLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(passowrdTextField.snp.bottom).offset(5)
        }
        
        containerView.addSubview(signInButton)
        signInTopConstraint = signInButton.topAnchor.constraint(equalTo: willNotShareLabel.bottomAnchor, constant: 70)
        signInButton.snp.makeConstraints { make in
            signInTopConstraint.isActive = true
            make.centerX.equalToSuperview()
            make.width.equalTo(230)
            make.height.equalTo(40)
        }
        
        containerView.addSubview(forgotPasswordLabel)
        forgotPasswordLabel.snp.makeConstraints { make in
            make.top.equalTo(signInButton.snp.bottom).offset(15)
            make.centerX.equalToSuperview()
            make.width.equalTo(85)
            make.height.equalTo(25)
        }
    }

    private func removeObservers() {
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    private func toggleVibration() {
        let vibration = UINotificationFeedbackGenerator()
        vibration.notificationOccurred(.success)
    }
    
    // MARK:- Selectors
    @objc func onSignInAction() {
        toggleVibration()
        navigation?.presentUsernameInput(from: self)
    }

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
    
    @objc func keyboardWillShow(notification: NSNotification) {
        UIScreen.isSmallScreen ? (onKeyboardShowConstraint = 40) : (onKeyboardShowConstraint = 0)
        if isKeyboardHidden {
            if let keyboardFrame: NSValue = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue {
                keyboardHeight = keyboardFrame.cgRectValue.height
                containerTopConstraint.constant -= keyboardHeight / 3
                signInTopConstraint.constant -= onKeyboardShowConstraint
            }
            
            isKeyboardHidden = false
        }
    }
    
    @objc func keyboardWillHide(notification: NSNotification) {
        UIView.animate(withDuration: 0.5) {
            self.containerTopConstraint.constant += self.keyboardHeight / 3
            self.signInTopConstraint.constant += self.onKeyboardShowConstraint
        }
        
        self.isKeyboardHidden = true
    }
}
