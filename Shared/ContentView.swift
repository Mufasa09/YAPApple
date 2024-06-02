//
//  ContentView.swift
//  Shared
//
//  Created by Joel Musita on 3/8/21.
//

import SwiftUI
import Firebase
import FirebaseCore
import FirebaseAuth
import FirebaseAnalyticsSwift


let lightGreyColor = Color(red: 239.0/255.0, green: 243.0/255.0, blue: 244.0/255.0)
let StoredUsername = "Jmusita"
let StoredPassword = "1234"

extension View{
        func landscape() -> some View{
            self.modifier(LandscapeModifier())
        }
    }
struct LandscapeModifier: ViewModifier{
    func body(content: Content) -> some View{
        content
            .previewLayout(.fixed(width: 812, height: 375))
            .environment(\.horizontalSizeClass, .compact)
            .environment(\.verticalSizeClass, .compact)
    }
}

struct ContentView: View {
    
    @State var username: String = "admin"
    @State var password: String = "admin"
    @State var wrongUsername = 0
    @State var wrongPassword = 0
    @State var authenticationDidFail: Bool = false
    @State var authenticationDidPass: Bool = false
    @State var showingLoginScreen = false;
    
    var body: some View {

        
        
        NavigationView{
            ZStack{

                VStack{

                    
                    TextField("Username", text:$username)
                        .padding()
                        .frame(width: 300, height: 50)
                        .background(Color.black.opacity(0.05))
                        .cornerRadius(10)
                        .border(.red, width: CGFloat(wrongUsername))
                    
                    SecureField("Password", text:$password)
                        .padding()
                        .frame(width: 300, height: 50)
                        .background(Color.black.opacity(0.05))
                        .cornerRadius(10)
                        .border(.red, width: CGFloat(wrongPassword))
                
                
                    Button("Login"){
                        authenticateUser(username: username, password: password)
                    }
                    .foregroundColor(.white)
                    .frame(width: 300, height: 50)
                    .background(Color.blue)
                    .cornerRadius(10)
                    
                    NavigationLink(destination: Text("You are logged in @\(username)"), isActive: $showingLoginScreen){
                        EmptyView()
                    }
                }
        }
            .navigationBarHidden(true)
    }
}
    
    func authenticateUser(username: String, password: String){
        if username.lowercased() == "admin"{
            wrongUsername = 0
            if password.lowercased() == "admin"{
                wrongPassword = 0
                showingLoginScreen = true
            }else{
                wrongPassword = 2
            }
        }else{
            wrongPassword = 2
        }
    }
    
    
    struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView()
        }
    }

    
}
}
