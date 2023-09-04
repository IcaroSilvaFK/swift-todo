//
//  SplashView.swift
//  first-app
//
//  Created by Icaro on 27/08/23.
//

import SwiftUI

struct SplashView: View {
    
    @ObservedObject var viewModel: SplashViewModel
        

    var body: some View {
        Group{
            switch viewModel.uiState {
            case .loading:
                    loading
            case .goToSignInScreen:
//                LoginView(viewModel: viewModel)
                    Text("hello world")
            case .goToHome:
                Text("Go to home")
            case .error(let msg):
                ErrorScreen(message: msg, action: viewModel.redirectToLogin)
            }
        }
        .onAppear(perform: viewModel.onAppear)
    }
}


extension SplashView{
    var loading: some View {
        SplashImage(image: "logo")
    }
    
    
    func loadingView() -> some View {
            SplashImage(image: "logo")
    }
}

struct SplashView_Previews: PreviewProvider {
    static var previews: some View {
        SplashView(viewModel: SplashViewModel())
        
    }
}
