//
//  LoginContainerView.swift
//  Onboarding
//
//  Created by Rodion Kuskov on 2/2/20.
//  Copyright © 2020 Rodion Kuskov. All rights reserved.
//

import Foundation
import SnapKit
import UIKit

class LoginContainerView: UIView {

    // MARK:- UI Components
    private lazy var signInWithApple: UIButton = {
        let button = UIButton()
        button.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        button.setTitle(" Sign in with Apple", for: .normal)
        button.titleLabel?.font = .systemMedium(size: 14.5)
        button.setTitleColor(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.cornerRadius = 5
        return button
    }()
    
    private lazy var otherSignIn: UIButton = {
        let button = UIButton()
        button.backgroundColor = .clear
        button.setTitle("Other sign in options", for: .normal)
        button.titleLabel?.font = .systemMedium(size: 14.5)
        button.setTitleColor(#colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.borderWidth = 0.5
        button.layer.borderColor = .mainBorderColor
        button.layer.cornerRadius = 5
        return button
    }()
    
    private lazy var stayAnonymously: UILabel = {
        let label = UILabel()
        label.font = .systemRegular(size: 10)
        label.textColor = .white
        label.isUserInteractionEnabled = true
        label.attributedText = NSAttributedString(
                                string: "Stay anonymously",
                                attributes: [
                                    .underlineStyle: NSUnderlineStyle.single.rawValue])
        return label
    }()
    
    // MARK:- Actions
    var onOtherSignInAction: (() -> ())?
    
    // MARK:- Init
    override init(frame: CGRect) {
        super.init(frame: .zero)
        initialSetup()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        initialSetup()
    }
    
    // MARK:- Initial setup
    private func initialSetup() {
        addSubviews()
        addSelectors()
    }

    private func addSubviews() {
        addSubview(signInWithApple)
        signInWithApple.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
            make.width.equalTo(230)
            make.height.equalTo(45)
        }
        
        addSubview(otherSignIn)
        otherSignIn.snp.makeConstraints { make in
            make.top.equalTo(signInWithApple.snp.bottom).offset(20)
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
            make.width.equalTo(230)
            make.height.equalTo(45)
        }
        
        addSubview(stayAnonymously)
        stayAnonymously.snp.makeConstraints { make in
            make.top.equalTo(otherSignIn.snp.bottom).offset(20)
            make.centerX.equalToSuperview()
            make.height.equalTo(12)
        }
    }
    
    private func addSelectors() {
        signInWithApple.addTarget(self, action: #selector(onSignInWithAppleTapped), for: .touchUpInside)
        otherSignIn.addTarget(self, action: #selector(onOtherSignInTapped), for: .touchUpInside)
        
        let anonGesture = UITapGestureRecognizer(target: self, action: #selector(onStayAnonymouslyTapped))
        stayAnonymously.addGestureRecognizer(anonGesture)
    }
    
    // MARK:- Selectors
    @objc func onSignInWithAppleTapped() {
//        navigation?.signInWithApple()
    }
    
    @objc func onOtherSignInTapped() {
        onOtherSignInAction?()
    }
    
    @objc func onStayAnonymouslyTapped() {
//        navigation?.signInAnonymously()
    }
}
