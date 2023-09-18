//
//  LoginView.swift
//  first-app
//
//  Created by Icaro on 27/08/23.
//

import SwiftUI

struct LoginView: View {
    
    @ObservedObject var viewModel: SignInViewModel
    
    @State var email: String = ""
    @State var password: String = ""
    @State var isSecureEntry = true
    @State var action: Int? = 0
    @State var isVisibleNavigationBar = true
    
    
    var currentViewId = UUID()
    
    var body: some View {
        ZStack {
            if case SignInUIState.gotToHomeScreen = viewModel.uiState {
                viewModel.homeView()
            }else {
                NavigationView{
                    ScrollView(showsIndicators: false){
                        VStack(alignment: .center, spacing: 20) {
                            Spacer(minLength: 100)
                            VStack(alignment: .center, spacing: 12) {
                                Image("logo")
                                    .resizable()
                                    .frame(maxWidth: CGFloat(250), maxHeight: CGFloat(80))
                                Text("Login")
                                    .font(.title3)
                                    .fontWeight(.bold)
                                    .foregroundColor(Color.orange)
                                
                                VStack(spacing: 12) {
                                    
                                    emailTextField
                                    
                                    
                                    if isSecureEntry {
                                        passwordSecureTextField
                                    }else {
                                        passwordPlainTextField
                                    }
                                    
                                    
                                    Button{
                                        print(password)
                                        viewModel.login(username: email, password: password)
                                    } label: {
                                        Text("Entrar")
                                            .padding([.vertical], 10)
                                        
                                    }
                                    .foregroundColor(Color.white)
                                    .cornerRadius(CGFloat(6))
                                    .frame(maxWidth: .infinity)
                                    .background(Color.orange)
                                    .cornerRadius(4)
                                    .overlay(
                                        RoundedRectangle(cornerRadius: 4)
                                            .stroke(.orange, lineWidth: 1)
                                    )
                                    
                                    navLink
                                }
                                .padding(22)
                             
                            }
                           
                        }
                   
                    }
              
                    
                }
                .navigationBarTitle("Login", displayMode: .inline)
                .navigationBarHidden(isVisibleNavigationBar)
                .navigationBarBackButtonHidden(true)
                .id(currentViewId)
            }
            if case SignInUIState.error(let value) = viewModel.uiState {
                ErrorScreen(message: value) {
                    viewModel.redirectToLoginScreen()
                }
            }
            
        }
        
      
    }
}


extension LoginView {
    var emailTextField: some View {
        VStack {
            TextField("Email", text: $email)
                .listRowBackground(Color.clear)
                .foregroundColor(.black)
                .padding(6)
            
        }
        .frame( height: CGFloat(40))
        .background(Color.gray.opacity(0.2))
        .cornerRadius(4)
        .overlay(
            RoundedRectangle(cornerRadius: 4)
                .stroke(.gray.opacity(0.2), lineWidth: 1)
        )
    }
    
    var passwordSecureTextField: some View  {
        HStack {
            SecureField("Password", text: $password)
                .listRowBackground(Color.clear)
                .foregroundColor(.black)
                .padding(6)
            Button {
                isSecureEntry = false
            }label: {
                Image(systemName: "eye.fill")
            }
            .padding([.horizontal],CGFloat(8))
            .foregroundColor(.orange)
        }
        .frame( height: CGFloat(40))
        .background(Color.gray.opacity(0.2))
        .cornerRadius(4)
        .overlay(
            RoundedRectangle(cornerRadius: 4)
                .stroke(.gray.opacity(0.2), lineWidth: 1)
        )
    }
    
    var passwordPlainTextField: some View {
        HStack {
            TextField("Password", text: $password)
                .listRowBackground(Color.clear)
                .foregroundColor(.black)
                .padding(6)
            Button {
                isSecureEntry = true
            }label: {
                Image(systemName: "eye.slash.fill")
            }
            .padding([.horizontal],CGFloat(8))
            .foregroundColor(.orange)
        }
        .frame( height: CGFloat(40))
        .background(Color.gray.opacity(0.2))
        .cornerRadius(4)
        .overlay(
            RoundedRectangle(cornerRadius: 4)
                .stroke(.gray.opacity(0.2), lineWidth: 1)
        )
    }
    
    var navLink: some View {
        VStack {
            Text("Ainda não possui um login ativo?")
                .foregroundColor(.orange)
                .padding(.top, 48)
            
            ZStack {
                NavigationLink(
                    destination: viewModel.sigUpView(),
                    tag: 1,
                    selection: $action,
                    label: {
                        EmptyView()
                    })
                   .navigationBarBackButtonHidden()
                Button("Realize seu castro"){
                    self.action = 1
                }
                .foregroundColor(.gray)
                .padding(.top, 4)
                    
            }
            Text("Copyright @YYY")
                .foregroundColor(Color.orange)
                .font(Font.system(size: 12).bold().italic())
                .padding(.top, 180)
        }
    }
    
}
struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView(viewModel: SignInViewModel())
    }
}
