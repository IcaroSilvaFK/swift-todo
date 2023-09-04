//
//  first_appApp.swift
//  first-app
//
//  Created by Icaro on 27/08/23.
//

import SwiftUI

@main
struct first_appApp: App {
    var body: some Scene {
    
        
        WindowGroup {
            SplashView(viewModel: SplashViewModel())
        }
    }
}
