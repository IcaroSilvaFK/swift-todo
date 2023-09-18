//
//  HomeViewModel.swift
//  first-app
//
//  Created by Icaro on 05/09/23.
//

import Foundation
import SwiftUI

class HomeViewModel: ObservableObject {
    
    
}


extension HomeViewModel {
    func goToAddNewTodoView()-> some View {
        HomeModelRouter.makeAddTodoView()
    }
    
    func goToTaskDetails(_ taskId: Int)-> some View {
        HomeModelRouter.makeTaskDetailsView(taskId: taskId)
    }
}
