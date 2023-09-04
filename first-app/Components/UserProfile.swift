//
//  UserProfile.swift
//  first-app
//
//  Created by Icaro on 07/09/23.
//

import SwiftUI

struct UserProfile: View {
    
    @State var onClick: () -> Void
    
    var body: some View {
        VStack(alignment: .leading){
            HStack{
                ZStack {
                    Circle()
                        .fill(
                            LinearGradient(
                                colors: [Color.orange, Color.red],
                                startPoint: .topLeading,
                                endPoint: .bottomLeading
                            )
                        )
                        .frame(width: 45)
                    
                    Image(systemName: "person.fill")
                        .resizable()
                        .frame(width: 20, height: 20)
                        .foregroundColor(Color.white)
                }
                HStack(alignment: .center,spacing: 12) {
                    VStack(alignment: .leading) {
                        Text("Olá")
                            .font(Font.system(size: 14))
                            .foregroundColor(Color.gray)
                        Text("Icaro Vieira")
                            .font(Font.system(size: 16).bold())
                            .foregroundColor(Color.orange)
                    }
                    Spacer()
                    Button{
                        onClick()
                    }label: {
                        Image(systemName: "square.and.arrow.up.on.square.fill")
                            .resizable()
                            .foregroundColor(Color.red)
                            .frame(width: 25, height: 25)
                    }
                }
            }
        }
    }
}

#Preview {
    UserProfile(onClick: {
        print("Hello world")
    })
}
