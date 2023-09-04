//
//  ErrorScreen.swift
//  first-app
//
//  Created by Icaro on 27/08/23.
//

import SwiftUI

struct ErrorScreen: View {
    @State var title: String?
    @State var message: String
    @State var action: () -> Void
    
    var body: some View {
        VStack(spacing: CGFloat(20)){
            Image(systemName: "info.circle.fill")
                .resizable()
                .scaledToFit()
                .frame(maxWidth: CGFloat(45),maxHeight: CGFloat(45))
                .foregroundColor(Color.white)
            
            VStack(spacing: CGFloat(8)) {
                Text(title ?? "Error inesperado")
                    .font(.title2)
                    .foregroundColor(Color.white)
                    .fontWeight(Font.Weight.bold)
                    
                Text(message)
                    .multilineTextAlignment(.trailing)
                    .foregroundColor(Color.white)
                    .font(.title3)
             
                VStack{
                    Button{
                        action()
                    } label: {
                        Text("Voltar")
                            .foregroundColor(Color.red)
                            .fontWeight(Font.Weight.bold)
                            .font(.body)
                    }
                    .padding([.vertical], 12)
                    .padding([.horizontal], 22)
                    .background(Color.white)
                    .cornerRadius(CGFloat(8))
                }.padding()
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .padding()
        .background(Color.red)
  
        .ignoresSafeArea()
    }
}

struct ErrorScreen_Previews: PreviewProvider {
    static var previews: some View {
        ErrorScreen(title: "Icaro Vieira", message: "Ocorreu um erro inesperado do backend") {
            print("a")
        }
    }
}
