//
//  NavigationService.swift
//  Onboarding
//
//  Created by Rodion Kuskov on 2/2/20.
//  Copyright © 2020 Rodion Kuskov. All rights reserved.
//

import Foundation
import UIKit

protocol NavigationService: class {
    func presentSignInOptions(from: UIViewController)
    func signInWithApple()
    func signInAnonymously()
    func presentUsernameInput(from: UIViewController)
}
