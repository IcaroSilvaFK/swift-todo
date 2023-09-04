//
//  SplashViewModel.swift
//  first-app
//
//  Created by Icaro on 27/08/23.
//

import SwiftUI

class SplashViewModel: ObservableObject {
    
    @Published var uiState: SplashUIState  = .loading
    
    
    func redirectToLogin() {
        self.uiState = .loading
    }
    
    func onAppear() {
        // faz algo assincrono e muda o estado do uiState
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            // aqui é chamado depois de 2 segundos
            
            self.uiState = .goToSignInScreen
        }
    }
    
    
    func signInView()->some View{
        return SplashViewRouter.makeSignInView()
    }
    
}
