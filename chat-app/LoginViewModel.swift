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
    @Published var errorMessage = ""
    
    @Binding var isSignedIn: Bool
    
    init(bindingField: Binding<Bool>) {
        _isSignedIn = bindingField
    }

    func signInOrSignUp(email: String, password: String, isSignup: Bool) {
        if isSignup {
            signUp(email: email, password: password)
        } else {
            signIn(email: email, password: password)
        }

    }
    
    func signIn(email: String, password: String) {
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
    
    func signUp(email: String, password: String){
        Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
                       if let error = error {
                           print("Error creating user:", error.localizedDescription)
                           // Handle error during user registration
                       } else {
                           print("User created successfully:", authResult?.user.uid ?? "No user UID")
                           // Optionally, sign in the newly registered user after successful registration
                           self.signIn(email: email, password: password)
                       }
                   }
    }
    // You can add more methods for sign-up, sign-out, etc.
}
