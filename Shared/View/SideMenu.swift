//
//  SideMenu.swift
//  YAP (iOS)
//
//  Created by Joel Musita on 6/2/24.
//

import SwiftUI

struct SideMenu: View {
    
    @Binding var selectedTab: String
    @Namespace var animation
    var body: some View {
        VStack(alignment: .leading, spacing: 15,
               content:{
            
            //Profile Pic ...
            Image("kmdlogo")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 70, height: 70, alignment: .top)
                .cornerRadius(10)
            //Padding top for Top Close Button..
                .padding(.top, 50)
            
            VStack(alignment: .leading, spacing: 6,
                   content: {
                
                Text("User Name")
                    .font(.title)
                    .fontWeight(.heavy)
                    .foregroundColor(.white)
                
                Button(action:{},label: {
                    Text("View Profile")
                        .fontWeight(.semibold)
                        .foregroundColor(.black)
                        .opacity(0.7)
                })
            })
            
            //tab Buttons..
            VStack(alignment: .leading, spacing: 10){
                
                TabButton(image: "house", title: "Home", selectedTab: $selectedTab, animation: animation)
                
                TabButton(image: "clock.arrow.circlepath", title: "History", selectedTab: $selectedTab, animation: animation)
                
                TabButton(image: "bell.badge", title: "Notifications", selectedTab: $selectedTab, animation: animation)
               
                TabButton(image: "gearshape.fill", title: "Settings", selectedTab: $selectedTab, animation: animation)
                
                TabButton(image: "questionmark.circle", title: "Help", selectedTab: $selectedTab, animation: animation)
            }
            .padding(.leading, -15)
            .padding(.top,50)
            
            Spacer()
            
            //Sign Out Button...
            VStack(alignment: .leading, spacing: 6, content: {
                TabButton(image: "rectangle.righthalf.inset.fill.arrow.right", title: "Log out", selectedTab: .constant(""), animation: animation)
                    .padding(.leading, -15)
            })
            
        })
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
    }
}

#Preview {
    MainView()
}