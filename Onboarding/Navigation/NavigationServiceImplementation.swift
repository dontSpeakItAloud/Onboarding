//
//  NavigationServiceImplementation.swift
//  Onboarding
//
//  Created by Rodion Kuskov on 2/2/20.
//  Copyright © 2020 Rodion Kuskov. All rights reserved.
//

import Foundation
import UIKit

class NavigationServiceImplementation: NavigationService {

    func presentSignInOptions(from: UIViewController) {
        let rootController = EmailLoginController()
        rootController.navigation = self
        let navigationController = UINavigationController(rootViewController: rootController)
        navigationController.setNavigationBarHidden(true, animated: false)
        from.present(navigationController, animated: true)
    }
    
    func signInWithApple() {
        print("Sign in with apple")
    }
    
    func signInAnonymously() {
        print("Stay anonymously")
    }
    
    func presentUsernameInput(from: UIViewController) {
        let controller = UsernameViewController()
        from.navigationController?.pushViewController(controller, animated: true)
    }
}
