//
//  ContentView.swift
//  first-app
//
//  Created by Icaro on 27/08/23.
//

import SwiftUI

//let url = URL(string: "https://api.github.com/users/IcaroSilvaFK" )!
//
//let task = URLSession.shared.dataTask(with: url) { data,response,error in
//    if error != nil {
//        print(error)
//        return
//    }
//    print(data)
//    print(response)
//}



struct ContentView: View {
//    @State var user = task.resume()
    @State var isVisible = false
    @State var notification = false
    
   
    
    func requestPermission() {
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert]) { success,error in
            if success {
                notification = true
            }else if let err = error {
                notification = false
                print(err.localizedDescription)
            }
        }
    }
    
    func sendNotification() {
        let notificationContent = UNMutableNotificationContent()
        
        notificationContent.title = "Hello world"
        notificationContent.subtitle = "Here's how you send a notification in SwiftUI"
        
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5, repeats: false)
        
        let req = UNNotificationRequest(identifier: UUID().uuidString, content: notificationContent, trigger: trigger)
     
        UNUserNotificationCenter.current().add(req)
    }
    
    var body: some View {
        ZStack {
            Circle()
                .fill(
                    LinearGradient(
                        colors: [.yellow,.green],
                        startPoint: .leading,
                        endPoint: .bottom
                    )
                )
            
            VStack {
                Image(systemName: "globe")
                    .imageScale(.large)
                    .foregroundColor(.blue)
                    .font(.title)
                Text("Hello, world!")
                    .foregroundColor(.blue)
                    .bold()
                    .font(.largeTitle)
                Button {
                    isVisible = !isVisible
                }label: {
                    Text("Click me")
                }
                
                HStack {
                    Button{
                        requestPermission()
                    } label: {
                        Text("Acesso a notificação")
                    }
                    .foregroundColor(.white)
                    
                    Button{
                        sendNotification()
                    } label: {
                        Text("Notificar")
                    }
                    .foregroundColor(.white)
                    .padding(.all, 2)
                }
                .onAppear{
                    UNUserNotificationCenter.current().getNotificationSettings { settings in
                        if settings.authorizationStatus == .authorized {
                            notification = true
                        }
                        
                    }
                }
            }
            .padding()
            
           
        }
        .frame(width: 250)
        .alert(isPresented: $isVisible){ () -> Alert in
            return Alert(title: Text("Hello world"), message: Text("Mundo"))
        }
        
            
    }
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
            ContentView()
    }
}

