//
//  SideMenu.swift
//  YAP (iOS)
//
//  Created by Joel Musita on 6/2/24.
//

import SwiftUI
import PhotosUI


struct SideMenu: View {
    @EnvironmentObject var viewModel: AuthViewModel
    @StateObject var contentViewModel = ContentViewModel()
    @Binding var selectedTab: String
    @Namespace var animation
    
    
    var body: some View {
        if let user = viewModel.currentUser{
        VStack(alignment: .leading, spacing: 15,
               content:{
            
            //Profile Pic ...
            Image("kmdlogo")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 150, height: 150, alignment: .top)
                .cornerRadius(10)
            //Padding top for Top Close Button..
                .padding(.top, 50)
            
            VStack(alignment: .leading, spacing: 6){
                
                Text(user.fullname)
                    .font(.title)
                    .fontWeight(.heavy)
                    .foregroundColor(.white)
                
                    
            }
            
            //tab Buttons..
            VStack(alignment: .leading, spacing: 10){
                
                TabButton(image: "house", title: "Home", selectedTab: $selectedTab, animation: animation)
                
                TabButton(image: "person.wave.2", title: "Profile", selectedTab: $selectedTab, animation: animation)
               
                TabButton(image: "video.square.fill", title: "Videos", selectedTab: $selectedTab, animation: animation)
            }
            .padding(.leading, -15)
            .padding(.top,50)
            
            Spacer()
            
            //Sign Out Button...
            
            VStack(alignment: .leading, spacing: 6, content: {
                Button{
                    viewModel.signOut()
                } label: {
                    HStack{
                        Image(systemName: "rectangle.righthalf.inset.fill.arrow.right")
                        Text("Logout")
                            .fontWeight(.semibold)
                    }
                    .foregroundColor(.white)
                    .padding(.leading, -1)
                }
            })
        })
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
        }
    }
}

#Preview {
    MainView()
}
