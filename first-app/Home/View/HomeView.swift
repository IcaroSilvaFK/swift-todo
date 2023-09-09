//
//  HomeView.swift
//  first-app
//
//  Created by Icaro on 05/09/23.
//

import SwiftUI

struct HomeView: View {
    
    @ObservedObject var viewModel: HomeViewModel
    
    var tasks = [
        (
            isCompleted: false,
            task: "Task 1"
        ),
        (
            isCompleted: false,
            task: "Task 2"
        ),
        (
            isCompleted: true,
            task: "Task 3"
        ),
        (
            isCompleted: false,
            task: "Task 4"
        ),
        (
            isCompleted: true,
            task: "Task 5"
        ), (
            isCompleted: true,
            task: "Task 6"
        )
        , (
            isCompleted: true,
            task: "Task 7"
        )
        , (
            isCompleted: false,
            task: "Task 8"
        )
        
    ]
    
    var body: some View {
        NavigationView {
            ScrollView(showsIndicators: false) {
                Spacer(minLength: 36)
                HStack{
                    UserProfile(content:{
                        viewModel.goToAddNewTodoView()
                    })
                }
                .padding()
                .frame(width: UIScreen.main.bounds.width, height: 70)
                
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 32) {
                        CardNavigateToCategory(
                            title: "Teste",
                            icon: "paperplane.fill",
                            titleColor: Color.white,
                            background: Color.green,
                            action: {
                                print("a")
                            }
                        )
                        CardNavigateToCategory(
                            title: "Teste",
                            icon: "trash.square.fill",
                            titleColor: Color.white,
                            background: Color.red,
                            action: {
                                print("a")
                            }
                        )
                        CardNavigateToCategory(
                            title: "Teste",
                            icon: "power",
                            titleColor: Color.white,
                            background: Color.orange,
                            action: {
                                print("a")
                            }
                        )
                    }
                    .padding(.horizontal, 22)
                    .padding(.vertical, 12)
                }
                
                
                VStack {
                    HStack {
                        Text("Tarefas de hoje")
                            .font(Font.system(size: 22).bold())
                            .foregroundColor(Color.gray)
                        
                        
                        Spacer()
                        
                        Text("\(tasks.count)")
                            .font(Font.system(size: 18).bold())
                        
                    }
                    ForEach(tasks, id: \.self.task) { task in
                        CardTask(isCompleted: task.isCompleted, task: task.task, action: {
                            print(task.task)
                        })
                        .padding(.top, 4)
                    }
                }
                .padding()
            }
            .ignoresSafeArea()
        }
         .navigationBarHidden(true)
    }
}


struct Home_Previews: PreviewProvider {
    static var previews: some View {
        HomeView(viewModel: HomeViewModel())
    }
}

