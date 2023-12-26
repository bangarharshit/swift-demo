//
//  ContentView.swift
//  chat-app
//
//  Created by Harshit Bangar on 25/12/23.
//

import SwiftUI


struct ContentView: View {
    @ObservedObject var contentViewModel: ContentViewModel
    var body: some View {
       if contentViewModel.isSignedIn {
           // Show user-specific content
           LoggedInView(loggedInViewModel: LoggedInViewModel(bindingField: $contentViewModel.isSignedIn))       } else {

           // Show login/signup views
           LoginView(loginViewModel: LoginViewModel(bindingField: $contentViewModel.isSignedIn))
       }
    }

}



#Preview {
    ContentView(contentViewModel: ContentViewModel())
}
