//
//  chat_appApp.swift
//  chat-app
//
//  Created by Harshit Bangar on 25/12/23.
//

import SwiftUI

@main
struct chat_appApp: App {
    // register app delegate for Firebase setup
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    var body: some Scene {
        WindowGroup {
            ContentView(contentViewModel: ContentViewModel())
        }
    }
}
