//
//  DemoAppApp.swift
//  DemoApp
//
//

import SwiftUI

@main
struct DemoAppApp: App {
    
    @AppStorage("isUserLogin") private var isUserLogin: Bool = false

    var body: some Scene {
        WindowGroup {
            if isUserLogin {
                HomeView()
            } else {
                LoginView()
            }
        }
    }
}
