//
//  SigInViewModel.swift
//  first-app
//
//  Created by Icaro on 03/09/23.
//

import SwiftUI


class SignInViewModel: ObservableObject {
    
    @Published var uiState: SignInUIState = .none
    
    
    func login(username: String, password: String) {
        
        DispatchQueue.main.asyncAfter(deadline: .now()) {
            self.uiState = .gotToHomeScreen
//            self.uiState = .error("Usuário ou senha incorreta")
        }
        
//        let url = URL(string: "https://api.github.com/users/\(username)")
    
//        guard let reqUrl = url else {fatalError("URL must be invalid")}
        
//        var req = URLRequest(url: reqUrl)
        
//        req.httpMethod = "GET"
        
//        let task = URLSession.shared.dataTask(with: req) { data,response,error in
//            if let error = error {
//                print("Error on request \(error)")
//                return
//            }
//            if let data = data, let dataString = String(data: data, encoding: .utf8){
//                print("Response data string: \n \(dataString)")
//            }
//          
//        }
        
//        task.resume()
    }
    
    
    func redirectToLoginScreen() {
        self.uiState = .none
    }
}


extension SignInViewModel {
    func homeView() -> some View {
        return SingnInViewRouter.makeHomeView()
    }
    
    func sigUpView()-> some  View {
        return SingnInViewRouter.makeSignUpView()
    }
}
