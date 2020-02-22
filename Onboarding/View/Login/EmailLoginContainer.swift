//
//  EmailLoginContainer.swift
//  Onboarding
//
//  Created by Rodion Kuskov on 2/20/20.
//  Copyright © 2020 Rodion Kuskov. All rights reserved.
//

import Foundation
import UIKit
import SnapKit

class EmailLoginContainer: UIViewController {
    
    // MARK:- UI Components
    private lazy var containerView: UIView = {
        let view = UIView()
        view.backgroundColor = .mainBackgroundColor
        view.layer.cornerRadius = 15
        return view
    }()
    
    private lazy var writeEmailLabel: UILabel = {
        let label = UILabel()
        label.text = "write your email".uppercased()
        label.font = .avenirRegular(size: 23)
        label.textColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        return label
    }()
    
    private lazy var belowLabel: UILabel = {
        let label = UILabel()
        label.text = "below".uppercased()
        label.font = .avenirDemiBold(size: 45)
        label.textColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        return label
    }()
    
    private lazy var emailTextField: LoginTextField = {
        let field = LoginTextField()
        field.configure(with: .email)
        return field
    }()
    
    private lazy var passowrdTextField: LoginTextField = {
        let field = LoginTextField()
        field.configure(with: .password)
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
        button.setTitle("Sign in", for: .normal)
        button.titleLabel?.font = .systemMedium(size: 14.5)
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
        view.backgroundColor = .clear
    }
    
    private func addGestures() {
        let forgotPasswordGesture = UITapGestureRecognizer(target: self, action: #selector(onForgotPasswordAction))
        forgotPasswordLabel.addGestureRecognizer(forgotPasswordGesture)
    }
    
    private func addSubviews() {
        view.addSubview(containerView)
        containerView.snp.makeConstraints { make in
            make.height.equalTo(view.snp.height).dividedBy(1.5)
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom)
            make.leading.equalToSuperview().offset(10)
            make.trailing.equalToSuperview().offset(-10)
        }
        
        containerView.addSubview(writeEmailLabel)
        writeEmailLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(30)
            make.leading.equalToSuperview().offset(25)
            make.height.equalTo(30)
        }
        
        containerView.addSubview(belowLabel)
        belowLabel.snp.makeConstraints { make in
            make.top.equalTo(writeEmailLabel.snp.bottom)
            make.leading.equalTo(writeEmailLabel.snp.leading)
            make.height.equalTo(60)
        }
        
        containerView.addSubview(emailTextField)
        emailTextField.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.bottom.equalTo(containerView.snp.centerY).offset(-30)
            make.width.equalToSuperview().dividedBy(1.25)
            make.height.equalTo(40)
        }
        
        containerView.addSubview(passowrdTextField)
        passowrdTextField.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(emailTextField.snp.bottom).offset(15)
            make.width.equalToSuperview().dividedBy(1.25)
            make.height.equalTo(40)
        }
        
        containerView.addSubview(willNotShareLabel)
        willNotShareLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(passowrdTextField.snp.bottom).offset(5)
        }
        
        containerView.addSubview(signInButton)
        signInButton.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(willNotShareLabel.snp.bottom).offset(40)
            make.width.equalTo(210)
            make.height.equalTo(40)
        }
        
        containerView.addSubview(forgotPasswordLabel)
        forgotPasswordLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(signInButton.snp.bottom).offset(15)
        }
    }
    
    // MARK:- Selectors
    @objc func onSignInAction() {}
    @objc func onForgotPasswordAction() {}
}
