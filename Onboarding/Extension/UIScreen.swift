//
//  UIViewController.swift
//  Onboarding
//
//  Created by Rodion Kuskov on 3/15/20.
//  Copyright © 2020 Rodion Kuskov. All rights reserved.
//

import Foundation
import UIKit

extension UIScreen {
    static var isSmallScreen: Bool {
        get {
            return UIScreen.main.bounds.width <= 375
        }
    }
}
