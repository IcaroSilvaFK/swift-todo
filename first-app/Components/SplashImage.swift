//
//  SplashImage.swift
//  first-app
//
//  Created by Icaro on 27/08/23.
//

import SwiftUI

struct SplashImage: View {
    
    @State var image: String
    
    var body: some View {
        ZStack{
            Image(image)
                .resizable()
                .scaledToFit()
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .padding(20)
                .background(Color.white)
                .ignoresSafeArea()
                
        }
    }
}




struct SplashImage_Previews: PreviewProvider {
    static var previews: some View {
        SplashImage(image:"logo")
    }
}
