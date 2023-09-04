//
//  HomeView.swift
//  first-app
//
//  Created by Icaro on 05/09/23.
//

import SwiftUI

struct HomeView: View {
    
    @ObservedObject var viewModel: HomeViewModel
    
    var body: some View {
        ScrollView{
            Spacer(minLength: 36)
            VStack{
               
                HStack{
                    UserProfile(onClick:{
                        print("a")
                    })
                  
                    Spacer()
                    
                }
                .padding()
                
                .frame(width: UIScreen.main.bounds.width)
            }
            .frame(width: UIScreen.main.bounds.width)
        }
        .ignoresSafeArea()
    }
}


struct Home_Previews: PreviewProvider {
    static var previews: some View {
        HomeView(viewModel: HomeViewModel())
    }
}

