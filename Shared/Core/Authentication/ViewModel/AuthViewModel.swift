//
//  AuthViewModel.swift
//  YAP (iOS)
//
//  Created by Joel Musita on 6/4/24.
//

import Foundation
import Firebase
import FirebaseFirestoreSwift

protocol AuthenticatoinFOrmProtocol{
    var formIsValid: Bool {get}
}

enum AuthenticationState{
    case unauthenticated
    case authenticating
    case authenticated
}

enum AuthenticationFlow{
    case login
    case signup
}

@MainActor
class AuthViewModel : ObservableObject{
    @Published var userSession: FirebaseAuth.User?
    @Published var currentUser: User?
    
    @Published var email: String = ""
    @Published var password: String = ""
    @Published var confirmPassword: String = ""
    
    @Published var flow: AuthenticationFlow = .login
    
    @Published var isValid: Bool = false
    @Published var authenticationState: AuthenticationState = .unauthenticated
    @Published var errorMessage: String = ""
    @Published var displayName: String = ""
    

    init(){
        self.userSession = Auth.auth().currentUser
        Task{
            await fetchUser()
        }
    }
    
    func signIn(withEmail email: String, password: String) async throws{
        
        do{
            let result = try await Auth.auth().signIn(withEmail: email, password: password)
            userSession = result.user
            print("User \(result.user.uid) signed in")
            //.self.userSession = result.user
            await fetchUser()
        }catch{
            print("DEBUG: Failed to log in with error \(error.localizedDescription)")
        }
    }

    
    func createUser(withEmail email: String, password: String, fullname: String) async throws{
        do{
            let result = try await Auth.auth().createUser(withEmail: email, password: password)
            userSession = result.user
            let user = User(id: result.user.uid, fullname: fullname, email: email)
            let encodedUser = try Firestore.Encoder().encode(user)
            try await Firestore.firestore().collection("user").document(user.id).setData(encodedUser)
            await fetchUser()
        }catch{
            print("DEBUG: Failed to create user with error \(error.localizedDescription)")
        }
    }
    
    func signOut(){
        do{
            try Auth.auth().signOut() //signs out user on backend
            self.userSession = nil // wipes out user session and takes you back to login screen
            self.currentUser = nil // wipes out current user session
        }catch{
            print("DEBUG: Failed to sign out with error \(error.localizedDescription)")
        }
    }
    
    func deleteAccount(){
//        do{
//            try await self.userSession?.delete()
//        }catch{
//            
//        }
    }
    
    func fetchUser() async {
        guard let userID = Auth.auth().currentUser?.uid else {return}
        print("DEBUG: USERID \(userID)")
        guard let snapshot = try? await Firestore.firestore().collection("user").document(userID).getDocument() else { return }
        self.currentUser = try? snapshot.data(as: User.self)
        print("DEBUG: CurrentUser \(self.currentUser)")
    }
}
