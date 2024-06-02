//
//  Home.swift
//  YAP (iOS)
//
//  Created by Joel Musita on 6/2/24.
//

import SwiftUI

struct Home: View {
    @Binding var selectedTab: String
    
    
    //Hiding Tab Bar....
    
    init(selectedTab: Binding<String>){
    
        self._selectedTab = selectedTab
        UITabBar.appearance().isHidden = true
    }
    
    
    var body: some View {
        
        //Tab View with Tabs...
        TabView(selection: $selectedTab){
            
            //Views....
            HomePage()
                .tag("Home")
            
            History()
                .tag("History")
            
            Settings()
                .tag("Settings")
            
            Help()
                .tag("Help")
            
            Notifications()
                .tag("Notifications")
            
        }
    }
}

#Preview {
    MainView()
}


//All Sub Views

struct HomePage: View{
    var body: some View{
        NavigationView{
            
            Text("Home")
                .font(.largeTitle)
                .fontWeight(.heavy)
                .foregroundColor(.primary)
                .navigationTitle("Home")
        }
    }
}

struct History: View{
    var body: some View{
        NavigationView{
            
            Text("History")
                .font(.largeTitle)
                .fontWeight(.heavy)
                .foregroundColor(.primary)
                .navigationTitle("History")
        }
    }
}

struct Notifications: View{
    var body: some View{
        NavigationView{
            
            Text("Notifications")
                .font(.largeTitle)
                .fontWeight(.heavy)
                .foregroundColor(.primary)
                .navigationTitle("Notifications")
        }
    }
}

struct Settings: View{
    var body: some View{
        NavigationView{
            
            Text("Settings")
                .font(.largeTitle)
                .fontWeight(.heavy)
                .foregroundColor(.primary)
                .navigationTitle("Settings")
        }
    }
}

struct Help: View{
    var body: some View{
        NavigationView{
            
            Text("Help")
                .font(.largeTitle)
                .fontWeight(.heavy)
                .foregroundColor(.primary)
                .navigationTitle("Help")
        }
    }
}


