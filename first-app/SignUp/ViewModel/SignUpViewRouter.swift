//
//  SignUpViewRouter.swift
//  first-app
//
//  Created by Icaro on 05/09/23.
//

import SwiftUI


struct SignUpViewRouter {
    static func makeSignIn()-> some View {
        LoginView(viewModel: SignInViewModel())
    }
}
