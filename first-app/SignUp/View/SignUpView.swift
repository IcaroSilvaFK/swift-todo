//
//  SignUpView.swift
//  first-app
//
//  Created by Icaro on 05/09/23.
//

import SwiftUI

struct SignUpView: View {
    
    @ObservedObject var viewModel: SignUpViewModel
    @State var username = ""
    @State var email = ""
    @State var password = ""
    @State var passwordValidate = ""
    @State var action: Int?
    
    var currentViewId = UUID()
    
    
    func handleCreateNewUser() {
        viewModel.createNewUser(username, email, password)
    }
    
    
    var body: some View {
        NavigationView{
            ScrollView{
                VStack {
                    Spacer(minLength: 120)
                    VStack{
                        Image("logo")
                            .resizable()
                            .frame(maxWidth: CGFloat(250), maxHeight: CGFloat(80))
                        
                        Text("Cadastro")
                            .font(.title3)
                            .foregroundColor(Color.orange)
                            .bold()
                        
                    }
                    VStack(spacing: 18){
                        HStack {
                            TextField("Nome do usuário", text: $username)
                                .frame(height: 40)
                                .padding(4)
                        }
                        .background(Color.gray.opacity(0.1))
                        .cornerRadius(4)
                        .overlay(
                            RoundedRectangle(cornerRadius: 4)
                                .stroke(.gray.opacity(0.1), lineWidth: 1)
                        )
                        
                        HStack{
                            TextField("Email", text: $email)
                                .frame(height: 40)
                                .padding(4)
                        }
                        .background(Color.gray.opacity(0.1))
                        .cornerRadius(4)
                        .overlay(
                            RoundedRectangle(cornerRadius:4)
                                .stroke(.gray.opacity(0.1), lineWidth: 1)
                        )
                        
                        HStack{
                            TextField("Senha", text: $password)
                                .frame(height: 40)
                                .padding(4)
                        }
                        .background(Color.gray.opacity(0.1))
                        .cornerRadius(4)
                        .overlay(
                            RoundedRectangle(cornerRadius: 4)
                                .stroke(.gray.opacity(0.1), lineWidth: 1)
                        )
                        
                        HStack{
                            TextField("Confirmar senha", text: $passwordValidate)
                                .frame(height: 40)
                                .padding(4)
                                .border(password == passwordValidate ? Color.white.opacity(0)  : .red)
                            
                        }
                        .background(Color.gray.opacity(0.1))
                        .cornerRadius(4)
                        .overlay(
                            RoundedRectangle(cornerRadius: 4)
                                .stroke(.gray.opacity(0.1), lineWidth: 1)
                        )
                        
                        VStack {
                            
                            Button {
                                
                                print("botao")
                                handleCreateNewUser()
                            } label: {
                                Text("Cadastrar")
                                    .padding([.top,.bottom], 12)
                            }
                            .frame(width: 360)
                            .background(Color.orange)
                            .foregroundColor(Color.white)
                            .cornerRadius(4)
                            .overlay(
                                RoundedRectangle(cornerRadius: 4)
                                    .stroke(.orange, lineWidth: 4)
                            )
                        }
                        .padding(.top, 22)
                        
                        linking
                    }
                    .padding()
                }
            }
        }
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarHidden(true)
        .id(currentViewId)
    }
    
}


extension SignUpView {
    var linking: some View {
        VStack {
            Text("Já possui conta?")
                .font(Font.system(size: 14))
                .foregroundColor(Color.gray.opacity(0.6))
            
            
            ZStack {
                NavigationLink(
                    destination: viewModel.navigateToSignIn(),
                    tag: 1,
                    selection: $action,
                    label: {
                        EmptyView()
                    }
                ).navigationBarBackButtonHidden()
                
                Button{
                    self.action = 1
                }label : {
                    HStack {
                        Image(systemName: "arrowshape.turn.up.left")
                            .foregroundColor(Color.orange)
                        
                        Text("Clique aqui")
                            .font(Font.system(size: 12))
                            .foregroundColor(Color.orange)
                    }
                    .padding(.top, 4)
                }
            }
        }
    }
}

struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView(viewModel: SignUpViewModel())
    }
}

