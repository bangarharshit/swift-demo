//
//  LoginViewModel.swift
//  chat-app
//
//  Created by Harshit Bangar on 25/12/23.
//

import Foundation


import SwiftUI
import Firebase

class LoginViewModel: ObservableObject {
    @Published var isSignedIn = false
    @Published var errorMessage = ""

    func signIn(email: String, password: String, isSignup: Bool) {
        if isSignup {
            Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
                           if let error = error {
                               print("Error creating user:", error.localizedDescription)
                               // Handle error during user registration
                           } else {
                               print("User created successfully:", authResult?.user.uid ?? "No user UID")
                               // Optionally, sign in the newly registered user after successful registration
                               self.signIn(email: email, password: password, isSignup: false)
                           }
                       }
        } else {
            Auth.auth().signIn(withEmail: email, password: password) { [weak self] authResult, error in
                guard let self = self else { return }
                if let error = error {
                    self.errorMessage = error.localizedDescription
                } else {
                    self.isSignedIn = true
                    // Additional actions upon successful sign-in
                }
            }
        }

    }

    // You can add more methods for sign-up, sign-out, etc.
}
