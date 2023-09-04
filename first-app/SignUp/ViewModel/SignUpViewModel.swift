//
//  SignUpViewModel.swift
//  first-app
//
//  Created by Icaro on 05/09/23.
//

import SwiftUI

class SignUpViewModel: ObservableObject {
    
    
    func navigateToSignIn()-> some View {
        SignUpViewRouter.makeSignIn()
    }
}
