//
//  LoggedInViewModel.swift
//  chat-app
//
//  Created by Harshit Bangar on 26/12/23.
//

import Foundation
import Firebase
import SwiftUI

class LoggedInViewModel: ObservableObject {
    
    @Binding var isSignedIn: Bool
    
    init(bindingField: Binding<Bool>) {
        _isSignedIn = bindingField
    }
    
    func signOut() {
          do {
              try Auth.auth().signOut()
              // Sign-out successful, navigate to another screen or update UI accordingly
              isSignedIn = false
          } catch let signOutError as NSError {
              // Failed to sign out
              print("Error signing out: \(signOutError.localizedDescription)")
          }
      }
}



