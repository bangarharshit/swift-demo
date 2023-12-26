//
//  LoggedInView.swift
//  chat-app
//
//  Created by Harshit Bangar on 26/12/23.
//

import Foundation

import Foundation

import SwiftUI

struct LoggedInView: View {
    @ObservedObject var loggedInViewModel: LoggedInViewModel

    var body: some View {
        VStack {
            Text("Welcome!")
            Button(action: signout) {
                Text("Signout")
            }
        }
    }
    func signout() {
        loggedInViewModel.signOut()
    }
    
}


