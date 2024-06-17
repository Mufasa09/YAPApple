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
  @AppStorage("shouldShowOnBoarding") var shouldShowOnBoarding: Bool = true

    
    var body: some View {
            ZStack{
                
                //Color(red: 0.4627, green: 0.8392, blue: 1.0)
                Color(Color.black)
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
                                //Moving up when clicked...
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
            .fullScreenCover(isPresented: $shouldShowOnBoarding, content: {
                OnboardingView(shouldShowOnBoarding: $shouldShowOnBoarding)
                })
    }
}

#Preview {
    MainView()
}

struct OnboardingView: View{
    @Binding var shouldShowOnBoarding: Bool
    
    var body: some View{
        TabView{
            PageView(title: "Push Notifications", subTitle: "Enable notifications", imageName: "bell",  showDismissButton: false, shouldShowOnBoarding: $shouldShowOnBoarding)
            
            PageView(title: "Test 123", subTitle: "Testing", imageName: "airplane",  showDismissButton: false, shouldShowOnBoarding: $shouldShowOnBoarding)
            
            PageView(title: "Last slide", subTitle: "Need to dismiss", imageName: "house", showDismissButton: true, shouldShowOnBoarding: $shouldShowOnBoarding)
            
        }
        .tabViewStyle(PageTabViewStyle())
    }
}

struct PageView: View{
    let title: String
    let subTitle: String
    let imageName: String
    let showDismissButton: Bool
    @Binding var shouldShowOnBoarding: Bool
    
    var body: some View{
        VStack{
            Image(imageName)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 150, height: 150)
                .padding()
            
            Text(title)
                .font(.system(size: 30))
                .padding()
            
            Text(subTitle)
                .font(.system(size: 24))
                .multilineTextAlignment(.center)
                .foregroundColor(Color(.secondaryLabel))
                .padding()
            
            if showDismissButton{
                Button(action: {
                    shouldShowOnBoarding.toggle()
                }, label: {
                    Text("Get Started")
                        .bold()
                        .foregroundColor(.white)
                        .frame(width: 200, height: 50)
                        .background(Color.green)
                    
                })
            }
        }
    }
}

//Extending View to get screen size....
extension View{
    
    func getRect()->CGRect{
        
        return UIScreen.main.bounds
    }
    
}
