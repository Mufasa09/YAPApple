//
//  YAPApp.swift
//  Shared
//
//  Created by Joel Musita on 3/8/21.
//

import SwiftUI
import FirebaseCore


class AppDelegate: NSObject, UIApplicationDelegate {
  func application(_ application: UIApplication,
                   didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
    FirebaseApp.configure()

    return true
  }
}
@main
struct YAPApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
