//
//  SignInViewRouter.swift
//  first-app
//
//  Created by Icaro on 05/09/23.
//

import SwiftUI


enum SingnInViewRouter {
    
    static func makeHomeView() -> some View {
        HomeView(viewModel: HomeViewModel())
    }
    
    static func makeSignUpView()-> some View {
        return SignUpView(viewModel: SignUpViewModel())
    }
}
