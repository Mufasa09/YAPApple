//
//  Home.swift
//  YAP (iOS)
//
//  Created by Joel Musita on 6/2/24.
//

import SwiftUI
import PhotosUI
import FirebaseAuth
import AVKit



struct Home: View {
    @Binding var selectedTab: String
    @EnvironmentObject var viewModel: AuthViewModel

    
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

            Videos()
                .tag("Videos")
            
            Profile()
                .tag("Profile")
            
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

struct Profile: View{
    var body: some View{
        NavigationView{
            ProfileView()
        }
    }
}

struct Videos: View{
    @StateObject var contentViewModel = ContentViewModel()

    var body: some View{
        NavigationStack{
            ScrollView{
                ForEach(contentViewModel.videos) { video in
                    VideoPlayer(player: AVPlayer(url: URL(string: video.videoUrl)!))
                        .frame(height: 250)
                }
            }
            .refreshable {
                Task { try await contentViewModel.fetchVideos()}
            }
            .navigationTitle("Feed")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar{
                ToolbarItem(placement: .navigationBarTrailing){
                    PhotosPicker(selection: $contentViewModel.selectedItem,
                                 matching: .any(of: [.videos, .not(.images)])){
                        Image(systemName: "plus")
                            .foregroundColor(.black)
                    }
                }
            }
            .padding()
            
        }
    }
}






