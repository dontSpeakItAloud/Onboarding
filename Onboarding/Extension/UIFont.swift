//
//  UIFont.swift
//  Onboarding
//
//  Created by Rodion Kuskov on 2/2/20.
//  Copyright © 2020 Rodion Kuskov. All rights reserved.
//

import Foundation
import UIKit

extension UIFont {
    class func avenirBold(size: CGFloat) -> UIFont {
        return UIFont(name: "AvenirNext-Bold", size: size) ?? UIFont.systemFont(ofSize: size)
    }
    
    class func avenirRegular(size: CGFloat) -> UIFont {
        return UIFont(name: "AvenirNext-Regular", size: size) ?? UIFont.systemFont(ofSize: size)
    }
    
    class func avenirDemiBold(size: CGFloat) -> UIFont {
        return UIFont(name: "AvenirNext-DemiBold", size: size) ?? UIFont.systemFont(ofSize: size)
    }
    
    class func systemMedium(size: CGFloat) -> UIFont {
        return UIFont.systemFont(ofSize: size, weight: .medium)
    }
    
    class func systemRegular(size: CGFloat) -> UIFont {
        return UIFont.systemFont(ofSize: size, weight: .regular)
    }
}
