//
//  FormNewTodoModel.swift
//  first-app
//
//  Created by Icaro on 07/09/23.
//

import Foundation
import SwiftUI


struct FormNewTodoModelNavigator {
    static func makeHomeView()-> some View {
        HomeView(viewModel: HomeViewModel())
    }
}
