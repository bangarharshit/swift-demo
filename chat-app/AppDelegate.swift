//
//  AppDelegate.swift
//  chat-app
//
//  Created by Harshit Bangar on 25/12/23.
//

import Foundation

import SwiftUI
import FirebaseCore
import FirebaseAppCheck

class AppDelegate: NSObject, UIApplicationDelegate {
  func application(_ application: UIApplication,
                   didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
  let providerFactory = AppCheckDebugProviderFactory()
  AppCheck.setAppCheckProviderFactory(providerFactory)
    FirebaseApp.configure()
    return true
  }
}
