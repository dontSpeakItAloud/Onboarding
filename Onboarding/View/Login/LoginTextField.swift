//
//  LoginTextField.swift
//  Onboarding
//
//  Created by Rodion Kuskov on 2/22/20.
//  Copyright © 2020 Rodion Kuskov. All rights reserved.
//

import Foundation
import UIKit

class LoginTextField: UITextField {
    enum TextFieldType {
        case email
        case password
    }

    func configure(with type: TextFieldType) {
        if type == .email {
            placeholder = "example@email.com"
            keyboardType = .emailAddress
            // TODO:- Add verification for email

        } else {
            placeholder = "password"
            isSecureTextEntry = true
            keyboardType = .default
            // TODO:- Add verification for password
        }

        layer.cornerRadius = 5
        layer.borderColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0).cgColor
        layer.borderWidth = 1
        autocorrectionType = .no
        autocapitalizationType = .none
        setLeftPadding(points: 10)
    }
}
