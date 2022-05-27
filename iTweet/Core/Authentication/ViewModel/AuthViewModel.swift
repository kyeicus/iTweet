//
//  AuthViewModel.swift
//  iTweet
//
//  Created by Emmanuel K. Nketia on 26/05/2022.
//

import SwiftUI
import Firebase


class AuthViewModel: ObservableObject {
    @Published var userSession: FirebaseAuth.User?
    
    init() {
        self.userSession = Auth.auth().currentUser
        
        print("DEBUG: User session is \(self.userSession)")
    }
    func login(withEmail email: String, password: String) {
        print("DEBUG Login with email \(email)")
    }
    
    func register(withEmail email: String, userName: String, name: String, password: String, confirmPassword: String) {
        Auth.auth().createUser(withEmail: email, password: password) { result, error in
            if let error = error {
                print("DEBUG: Failed to register user \(error.localizedDescription)")
                
                return
            }
            guard let user = result?.user else { return }
            self.userSession = user
            
            print("DEBUG: Registered User Succesfully")
            print("DEBUG: User is \(self.userSession)")
            
            let data = ["email": email , "username": userName.lowercased(),
                        "fullname": name, "uid": user.uid]
            
            Firestore.firestore().collection("users")
                .document(user.uid)
                .setData(data) { _ in
                    print("DEBUG: uploaded user data")
                    
            }
        }
    }
    
    func signOut() {
        userSession = nil
        try? Auth.auth().signOut() 
    }
}
