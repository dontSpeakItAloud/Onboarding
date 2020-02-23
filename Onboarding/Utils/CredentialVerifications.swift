//
//  CredentialVerifications.swift
//  Onboarding
//
//  Created by Rodion Kuskov on 2/23/20.
//  Copyright © 2020 Rodion Kuskov. All rights reserved.
//

import Foundation

class EmailVerification {
    static func isValid(_ value: String?) -> Bool {
        guard let inputText = value else {
            return false
        }
        
        let trimmedText = inputText.trimmingCharacters(in: .whitespacesAndNewlines)
        return emailRegex(for: trimmedText)
    }
    
    static func emailRegex(for text: String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
        let emailPred = NSPredicate(format: "SELF MATCHES %@", emailRegEx)
        let evaluated = emailPred.evaluate(with: text)

        return (text.count <= 250 && evaluated)
    }
}

class PasswordVerification {
    static func isValid(_ value: String?) -> Bool {
        guard let inputText = value else {
            return false
        }
        
        let trimmedText = inputText.trimmingCharacters(in: .whitespacesAndNewlines)
        return trimmedText.count >= 6 &&  trimmedText.count <= 100
    }
}
