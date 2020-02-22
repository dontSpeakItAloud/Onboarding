//
//  ViewController.swift
//  Onboarding
//
//  Created by Rodion Kuskov on 2/2/20.
//  Copyright © 2020 Rodion Kuskov. All rights reserved.
//

import UIKit
import SnapKit

class LoginViewController: UIViewController {
    private let navigation: NavigationService = ServiceProvider.shared.navigation
    
    //  MARK:- UI
    private lazy var haveFunLabel: HeaderLabelView = {
        let label = HeaderLabelView()
        return label
    }()
    
    private lazy var loginContainer: LoginContainerView = {
        let container = LoginContainerView()
        container.onOtherSignInAction = onOtherSignInAction
        return container
    }()
    
    //  MARK:- Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        initialSetup()
    }
    
    // MARK:- Private methods
    private func initialSetup() {
        view.backgroundColor = .mainBackgroundColor
        addSubviews()
        setupDelegates()
    }
    
    private func addSubviews() {
        view.addSubview(haveFunLabel)
        haveFunLabel.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(50)
            make.leading.equalToSuperview().offset(25)
            make.trailing.equalToSuperview()
            make.height.equalTo(100)
        }
        
        view.addSubview(loginContainer)
        loginContainer.snp.makeConstraints { make in
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom).offset(-75)
            make.centerX.equalToSuperview()
            make.height.equalTo(130)
        }
    }
    
    // MARK:- Actions
    func onOtherSignInAction() {
        navigation.presentSignInOptions(from: self)
    }
    
    // MARK:- Delegations
    private func setupDelegates() {}
}

