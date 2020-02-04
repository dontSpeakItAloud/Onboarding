//
//  ServiceProvider.swift
//  Onboarding
//
//  Created by Rodion Kuskov on 2/2/20.
//  Copyright © 2020 Rodion Kuskov. All rights reserved.
//

import Foundation

class ServiceProvider {
    static let shared = ServiceProvider()
    
    let navigation: NavigationService

    private init() {
        navigation = NavigationServiceImplementation()
    }
}
