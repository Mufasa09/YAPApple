//
//  MainView.swift
//  YAP (iOS)
//
//  Created by Joel Musita on 6/2/24.
//

import SwiftUI
import SwiftUI
import Firebase
import FirebaseCore
import FirebaseAuth
import FirebaseAnalyticsSwift



struct MainView: View {
    // selected Tab...
    @State var selectedTab = "Home"
    @State var showMenu = false

    
    var body: some View {
        
        ZStack{
            
            Color(red: 0.4627, green: 0.8392, blue: 1.0)
                .ignoresSafeArea()
            //Side Menu....
            SideMenu(selectedTab: $selectedTab)
            
            ZStack{
                //Two background cards
                
                Color.white
                    .opacity(0.5)
                    .cornerRadius(showMenu ? 15 : 0)
                //Shadow...
                    .shadow(color: Color.black.opacity(0.07), radius: 5, x:
                                -5, y:0)
                    .offset(x: showMenu ? -25 : 0)
                    .padding(.vertical, 30)
                
                Color.white
                    .opacity(0.5)
                    .cornerRadius(showMenu ? 15 : 0)
                //Shadow...
                    .shadow(color: Color.black.opacity(0.07), radius: 5, x:
                                -5, y:0)
                    .offset(x: showMenu ? -50 : 0)
                    .padding(.vertical, 60)


                
                Home(selectedTab: $selectedTab)
                    .cornerRadius(showMenu ? 15 : 0)
            }
            //Scaling And Moving the view....
                .scaleEffect(showMenu ? 0.84 : 1)
                .offset(x: showMenu ? getRect().width - 120 : 0)
                .ignoresSafeArea()
                .overlay(
                    
                    // Menu Button ...
                    Button(action:{
                        withAnimation(.spring()){
                            showMenu.toggle()
                        }
                    }, label:{
                        
                        //Animated Drawer button...
                        VStack(spacing: 5){
                            
                            Capsule()
                                .fill(showMenu ? Color.white : Color.primary)
                                .frame(width: 30, height: 3)
                            
                            //Rotating
                                .rotationEffect(.init(degrees: showMenu ? -50 : 0))
                                .offset(x: showMenu ? 2 : 0, y: showMenu ? 9 : 0)
                            
                            VStack(spacing: 5){
                                Capsule()
                                    .fill(showMenu ? Color.white : Color.primary)
                                    .frame(width: 30, height: 3)
                                //Moving up when clicked...d
                                Capsule()
                                    .fill(showMenu ? Color.white : Color.primary)
                                    .frame(width: 30, height: 3)
                                    .offset(y: showMenu ? -8 : 0)
                            }
                            .rotationEffect(.init(degrees: showMenu ? 50 : 0))

                        }
                    })
                    .padding()
                    ,alignment: .topLeading
            )
        }
    }
}

#Preview {
    MainView()
}


//Extending View to get screen size....
extension View{
    
    func getRect()->CGRect{
        
        return UIScreen.main.bounds
    }
    
}
