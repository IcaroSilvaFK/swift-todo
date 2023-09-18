//
//  CardTask.swift
//  first-app
//
//  Created by Icaro on 07/09/23.
//

import SwiftUI

struct CardTask: View {
    
    @State var isCompleted: Bool
    @State var task: String
    @State var action: () -> Void
    
    var body: some View {
        HStack {
            Circle()
                .fill(
                    isCompleted ? Color.green : Color.red
                )
                .frame(width: 20, height: 20)
            
            Text(task)
                .font(Font.system(size: 18).bold())
                .foregroundColor(Color.black)
            Spacer()
            Button{
                action()
            }label : {
                Image(systemName: "arrowshape.turn.up.forward.fill")
                    .foregroundColor(Color.orange)
            }
        }
        .padding()
        .border(Color.gray.opacity(0.3))
        .cornerRadius(4)
        .overlay(
            RoundedRectangle(cornerRadius: 4)
                .stroke(Color.gray.opacity(0.3),lineWidth: 1)
        )
    }
}

struct CardTask_Previews: PreviewProvider {
    static var previews: some View {
        CardTask(
            isCompleted: false, task: "Preview Content", action: {
                print("a")
            }
        )
    }
}
