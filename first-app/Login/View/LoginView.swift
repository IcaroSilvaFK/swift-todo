//
//  LoginView.swift
//  first-app
//
//  Created by Icaro on 27/08/23.
//

import SwiftUI

struct LoginView: View {
    
    @ObservedObject var viewModel: SignInViewModel
    
    @State var username: String = ""
    
   
    
    var body: some View {
        VStack {
            Image("logo")
                .resizable()
                .frame(maxWidth: CGFloat(250), maxHeight: CGFloat(80))
            Text("Login")
                .font(.title3)
                .fontWeight(.bold)
                .foregroundColor(Color.orange)
            
            VStack {
                
                VStack {
                    TextField("Username", text: $username)
                        .listRowBackground(Color.clear)
                        .foregroundColor(.black)
                        .padding(6)
                }
                .frame( height: CGFloat(40))
                .background(Color.gray.opacity(0.2))
            
                Button{
                    print(username)
//                    viewModel.login(username: username)
                } label: {
                    Text("Entrar")
                        .padding([.vertical], 10)
                        
                }
                .foregroundColor(Color.white)
                .cornerRadius(CGFloat(6))
                .frame(maxWidth: .infinity)
                .background(Color.orange)
            }
            .padding()
            .frame(maxWidth: CGFloat(350))
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView(viewModel: SignInViewModel())
    }
}
