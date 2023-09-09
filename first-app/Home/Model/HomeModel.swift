//
//  HomeModel.swift
//  first-app
//
//  Created by Icaro on 07/09/23.
//

import Foundation
import SwiftUI


struct HomeModelRouter {
    
    static func makeAddTodoView()-> some View {
        FormNewTodoView(viewModel: FormNewTodoViewModel())
    }
}
