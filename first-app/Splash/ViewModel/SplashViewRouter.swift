//
//  SplashViewRouter.swift
//  first-app
//
//  Created by Icaro on 03/09/23.
//

import SwiftUI

enum SplashViewRouter {
    
    static func makeSignInView()-> some View {
        let viewModel = SignInViewModel()
        
        return LoginView(viewModel: viewModel)
    }
}
