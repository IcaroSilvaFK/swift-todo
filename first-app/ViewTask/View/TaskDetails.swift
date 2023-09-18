//
//  TaskDetails.swift
//  first-app
//
//  Created by Icaro on 17/09/23.
//

import SwiftUI

struct TaskDetails: View {
    
    @State var taskId: Int
    @ObservedObject var viewModel: TaskDetailsViewModel
    
    var body: some View {
        Text("Task \(taskId)")
    }
}

struct TaskDetails_Previews: PreviewProvider {
    static var previews: some View {
        TaskDetails(taskId: 10, viewModel: TaskDetailsViewModel())
    }
}
