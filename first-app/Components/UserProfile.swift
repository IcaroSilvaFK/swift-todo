//
//  UserProfile.swift
//  first-app
//
//  Created by Icaro on 07/09/23.
//

import SwiftUI

struct UserProfile<Content: View>: View {
    
    var view:  Content
    
    @State var action: Int? = 0
        
    
    init(@ViewBuilder content: @escaping () -> Content) {
        self.view = content()
    }
    
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
                        
                        navLink
                    }
                }
            }
        }
    
}


extension UserProfile {
    var navLink: some View {
        ZStack {
            NavigationLink(
                destination: view,
                tag: 1,
                selection: $action,
                label: {
                    EmptyView()
                })
                .navigationBarBackButtonHidden()
            
            Button{
                action = 1
            }label: {
                Image(systemName: "plus.app.fill")
                    .resizable()
                    .foregroundColor(Color.orange)
                    .frame(width: 25, height: 25)
            }
        }
    }
}


struct UserProfile_Previews: PreviewProvider {
    static var previews: some View {
        UserProfile(content:{
            Text("a")
        })
    }
}
