//
//  ContentView.swift
//  Shared
//
//  Created by Joel Musita on 3/8/21.
//

import SwiftUI
import PhotosUI

struct ContentView: View {
    
    @EnvironmentObject var viewModel: AuthViewModel
    
    var body: some View {

        Group {
            if viewModel.userSession != nil{
                MainView()
            }else{
                LoginView()
            }
                
        }
    }
}
    
    struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
            ContentView()
    }

    
}

