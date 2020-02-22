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
        let controller = EmailLoginContainer()
        from.present(controller, animated: true)
    }
    
    func signInWithApple() {
        print("Sign in with apple")
    }
    
    func signInAnonymously() {
        print("Stay anonymously")
    }
}
