//
//  ContentViewModel.swift
//  chat-app
//
//  Created by Harshit Bangar on 25/12/23.
//

import Foundation
import Firebase
import SwiftUI

class ContentViewModel: ObservableObject {
    
    @Published var isSignedIn = false
    
    init() {
        // Check if a user is signed in
        if Auth.auth().currentUser != nil {
            // User is signed in
            self.isSignedIn = true
        }
    }
    
   

    // You can add more methods for sign-up, sign-out, etc.
}

