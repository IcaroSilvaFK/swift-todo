//
//  CardNavigateToCategory.swift
//  first-app
//
//  Created by Icaro on 07/09/23.
//

import SwiftUI

struct CardNavigateToCategory: View {
    
    @State var title: String
    @State var icon:String
    @State var titleColor: Color
    @State var background: Color
    @State var action: () -> Void
    
    var body: some View {
        Button{
            
        }label: {
            ZStack {
                RoundedRectangle(cornerRadius: 12)
                    .fill(background)
                    .frame(width: 200, height: 250)
                    .shadow(color: Color.gray.opacity(0.6),radius: 4, x: 0, y: 1)
                
                VStack(alignment: .center, spacing: 8) {
                        Text(title)
                            .font(Font.system(size: 32).bold())
                            .foregroundColor(Color.white)
                       
                        Image(systemName: icon)
                            .resizable()
                            .frame(width: 35, height: 35)
                            .foregroundColor(titleColor)
                }
                .frame(width: 200, height: 250)
                
            }
        }
        
    }
}

#Preview {
    CardNavigateToCategory(
        title: "Concluidas",
        icon: "checkmark.diamond.fill",
        titleColor: Color.white,
        background: Color.green,
        action: {
            print("a")
        }
    )
}
