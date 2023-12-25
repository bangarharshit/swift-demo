//
//  ContentView.swift
//  chat-app
//
//  Created by Harshit Bangar on 25/12/23.
//

import SwiftUI


struct ContentView: View {
    @ObservedObject var contentVM = ContentViewModel()
    var body: some View {
       if contentVM.isSignedIn {
           // Show user-specific content
           VStack {
               Text("Welcome!")
               Button(action: signout) {
                   Text("Signout")
               }
           }
       } else {
           // Show login/signup views
           LoginView()
       }
    }
    func signout() {
        contentVM.signOut()
    }
}



#Preview {
    ContentView()
}
