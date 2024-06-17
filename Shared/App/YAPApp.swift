//
//  YAPApp.swift
//  Shared
//
//  Created by Joel Musita on 3/8/21.
//

import SwiftUI
import Firebase

@main
struct YAPApp: App {
    @StateObject var viewModel = AuthViewModel()
    
    init(){
        FirebaseApp.configure()
            }
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(viewModel)
        }
    }
}
