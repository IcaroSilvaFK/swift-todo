//
//  FormNewTodoView.swift
//  first-app
//
//  Created by Icaro on 07/09/23.
//

import SwiftUI

struct FormNewTodoView: View {
    
    @ObservedObject var viewModel: FormNewTodoViewModel
    
    @State var todo: String = "Digite aqui"
    @State var isNotFirstTouch = false
    @State var isFinalized = false
    @State var action: Int? = 0
    
    func sendTodo() {
        viewModel.createNewTodo(todo: todo, isCompleted: isFinalized)
        
            todo = ""
            isFinalized = false
        
    }
    
    var body: some View {
        NavigationView{
            ScrollView{
                VStack {
                    HStack {
                        linking
                        
                        Spacer()
                        
                        Text("Adicionar")
                            .font(Font.system(size: 22).bold())
                            .foregroundColor(Color.orange)
                        
                        Spacer()
                    }
                    .padding()
                }
                Spacer(minLength: 160)
                
                VStack {
                    
                    HStack {
                        Text("Finalizado ?")
                            .font(Font.system(size: 18).bold())
                            .foregroundColor(Color.gray)
                        Spacer()
                        
                        Picker("Finalizado", selection: $isFinalized) {
                            VStack {
                                Text("Sim")
                            }
                            .tag(true)
                            
                            VStack{
                                Text("Não")
                            }
                            .tag(false)
                        }
                    }
                    .padding()
                    
                    VStack(alignment: .leading, spacing: 12) {
                        
                        Text("Digite aqui")
                            .font(Font.system(size: 18).bold())
                            .foregroundColor(Color.gray)
                        
                        TextEditor(text: $todo)
                            .multilineTextAlignment(/*@START_MENU_TOKEN@*/.leading/*@END_MENU_TOKEN@*/)
                            .frame(width: 350, height: 150)
                            .foregroundColor(Color.gray)
                            .cornerRadius(4)
                            .overlay(
                                RoundedRectangle(cornerRadius: 4)
                                    .stroke(Color.gray.opacity(0.3), lineWidth: 1)
                            )
                            .onTapGesture(perform: {
                                if(isNotFirstTouch) {
                                    return
                                }
                                
                                todo = ""
                                isNotFirstTouch = true
                            })
                    }
                    Button{
                        sendTodo()
                    }label : {
                        HStack {
                            Image(systemName:"plus.square.on.square")
                                .foregroundColor(Color.white)
                                .font(Font.system(size: 16).bold())
                            
                            Text("Adicionar")
                                .foregroundColor(Color.white)
                                .bold()
                            
                        }
                        .frame(maxWidth: 350)
                        .padding(16)
                        .background(Color.orange)
                        .cornerRadius(4)
                        .overlay(
                            RoundedRectangle(cornerRadius: 4)
                                .stroke(Color.gray.opacity(0.3), lineWidth:1)
                        )
                    }
                    .padding(.top, 22)
                    .frame(width: 350)
                    
                }
                Spacer()
            }
        }
        .navigationBarBackButtonHidden()
    }
    
}

extension FormNewTodoView {
    var linking: some View {
        ZStack {
            NavigationLink(
                destination: viewModel.navigateToHomePage(),
                tag: 1,
                selection: $action,
                label: {
                    EmptyView()
                })
            .navigationBarBackButtonHidden()
            
            Button{
                action = 1
            }label: {
                HStack {
                    Image(systemName:"arrowshape.turn.up.backward.fill")
                        .foregroundColor(Color.orange)
                }
                
            }
        }
    }
}

#Preview {
    FormNewTodoView(viewModel: FormNewTodoViewModel())
}
