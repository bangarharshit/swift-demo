//
//  LoginView.swift
//  chat-app
//
//  Created by Harshit Bangar on 25/12/23.
//

import Foundation

import SwiftUI

struct LoginView: View {
    @State private var email = ""
    @State private var password = ""
    @ObservedObject var loginViewModel: LoginViewModel
    @State private var isSignUp = false // Flag to determine if it's a sign-up or sign-in action
    @State private var showingAlert = false
    

    var body: some View {
        VStack {
            TextField("Email", text: $email)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()

            SecureField("Password", text: $password)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()

            Button(action: signInOrSignUp) {
                Text(isSignUp ? "Signup": "Login")
                    .padding()
                    .foregroundColor(.white)
                    .background(Color.blue)
                    .cornerRadius(8)
            }
            .padding()
            Button(action: toggleAuthAction) {
                            Text(isSignUp ? "Already have an account? Sign In" : "Don't have an account? Sign Up")
                                .foregroundColor(.blue)
                        }
        }
        .padding()
        .alert(isPresented: $showingAlert) {
                    Alert(title: Text("Error"), message: Text("Email or password cannot be empty."), dismissButton: .default(Text("OK")))
                }

    }
    
    func toggleAuthAction() {
           // Toggle between sign-up and sign-in mode
           isSignUp.toggle()
       }

    func signInOrSignUp() {
        guard !email.isEmpty, !password.isEmpty else {
            // Show an alert or perform error handling for empty email/password
            showingAlert = true
            return
        }

            // Trigger sign-in action using ViewModel method
        self.loginViewModel.signInOrSignUp(email: email, password: password, isSignup: isSignUp)
    }
}
