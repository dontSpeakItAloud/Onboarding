//
//  NavigationServiceImplementation.swift
//  Onboarding
//
//  Created by Rodion Kuskov on 2/2/20.
//  Copyright © 2020 Rodion Kuskov. All rights reserved.
//

import Foundation

class NavigationServiceImplementation: NavigationService {
    func presentSignInOptions() {
        print("Present other login options")
    }
    
    func signInWithApple() {
        print("Sign in with apple")
    }
    
    func signInAnonymously() {
        print("Stay anonymously")
    }
}
