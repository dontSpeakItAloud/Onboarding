//
//  NavigationService.swift
//  Onboarding
//
//  Created by Rodion Kuskov on 2/2/20.
//  Copyright © 2020 Rodion Kuskov. All rights reserved.
//

import Foundation

protocol NavigationService: class {
    func presentSignInOptions()
    func signInWithApple()
    func signInAnonymously()
}
