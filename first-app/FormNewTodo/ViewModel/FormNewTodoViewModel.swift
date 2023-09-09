//
//  FormNewTodoViewModel.swift
//  first-app
//
//  Created by Icaro on 07/09/23.
//

import Foundation
import SwiftUI


class FormNewTodoViewModel: ObservableObject {
    
    func createNewTodo(todo: String, isCompleted: Bool) {
        let url = URL(string: "http://localhost:8080")!
        
        var req = URLRequest(url: url)
        
        
        let body:[String: Any ] = ["task": todo, "completed": isCompleted]
        
        req.httpMethod = "POST"
        req.httpBody = try? JSONSerialization.data(withJSONObject: body)
            
        let task = URLSession.shared.dataTask(with: req) { data, response, err in
            
            guard let data = data, err == nil else {
                print("\(err)")
                return
            }
            
            print(data)
            
        }
        
        task.resume()
    }
    
}



extension FormNewTodoViewModel {
    
    func navigateToHomePage()-> some View {
        FormNewTodoModelNavigator.makeHomeView()
    }
}
