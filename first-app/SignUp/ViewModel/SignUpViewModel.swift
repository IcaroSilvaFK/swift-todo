//
//  SignUpViewModel.swift
//  first-app
//
//  Created by Icaro on 05/09/23.
//

import SwiftUI


class SignUpViewModel: ObservableObject {
    
    func createNewUser(_ username: String, _ email: String,_  password: String){
        
        print("Request")
        
        let body: [String: Any] = ["username": username, "email": email,"password": password]
        let url = URL(string: "https://88c4-138-219-101-120.ngrok-free.app/user")!
        
        var req = URLRequest(url: url)
        
        req.httpMethod = "POST"
        req.httpBody = try? JSONSerialization.data(withJSONObject: body, options: [])
        req.setValue("Application/json", forHTTPHeaderField: "Content-Type")
        
        let task = URLSession.shared.dataTask(with: req) {data, res, err in
            
            
            
            //            guard let data = data, err == nil else {
            //                print(err)
            //
            //                return
            //            }
            if let data = data {
                do {
                    let json = try JSONSerialization.jsonObject(with: data, options:[])
                    // TODO add method from persists user
                    print(json)
                }catch {
                    print(error)
                }
            }
            
            
        }
        
        task.resume()
        
    }
    
    
    func navigateToSignIn()-> some View {
        SignUpViewRouter.makeSignIn()
    }
}
