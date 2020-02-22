//
//  UIView.swift
//  Onboarding
//
//  Created by Rodion Kuskov on 2/20/20.
//  Copyright © 2020 Rodion Kuskov. All rights reserved.
//

import Foundation
import UIKit

extension UITextField {
    func setLeftPadding(points: CGFloat) {
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: points, height: self.frame.size.height))
        self.leftView = paddingView
        self.leftViewMode = .always
    }
}
