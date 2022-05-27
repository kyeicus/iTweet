//
//  RegistrationView.swift
//  iTweet
//
//  Created by Emmanuel K. Nketia on 26/05/2022.
//

import SwiftUI

struct RegistrationView: View {
    @State private var userName = ""
    @State private var email = ""
    @State private var name = ""
    @State private var password = ""
    @State private var confirmPassword = ""
    @EnvironmentObject var viewModel :AuthViewModel
    @Environment(\.presentationMode) var presemtationMode
    
    var body: some View {
        
        VStack{
            AuthHeaderView(logo: "tweet", title: "Create your Account")
            VStack (spacing: 40) {
                CustomInputField(imageName: "person", placeholderText: "Userename", text: $userName)
                CustomInputField(imageName: "envelope", placeholderText: "Email", text: $email)
                CustomInputField(imageName: "person", placeholderText: "Full Name", text: $name)
                CustomInputField (imageName: "lock", placeholderText: "Password", text: $password)
                CustomInputField (imageName: "lock", placeholderText: "Cofirm Password", text: $confirmPassword)
            }
            .padding(32)
            
            Button  {
                viewModel.register(withEmail: email, userName: userName, name: name, password: password, confirmPassword: confirmPassword)
            } label: {
                Text("Sign Up")
                    .font(.headline)
                    .foregroundColor(.white)
                    .frame(width: 340, height:  50)
                    .background(Color(.systemBlue))
                    .clipShape(Capsule())
                    .padding()
            }
            .shadow(color: .gray.opacity(0.5), radius: 10, x: 0, y: 0)
            Spacer()
            
            Button  {
                presemtationMode.wrappedValue.dismiss()
            } label: {
                HStack {
                    Text("Already have an account? ")
                        .font(.footnote)
                    
                    Text("Sign In")
                        .font(.footnote)
                        .fontWeight(.semibold)
                }
            }
            .padding(.bottom, 32)
        }
        .ignoresSafeArea()
    }
}
struct RegistrationView_Previews: PreviewProvider {
    static var previews: some View {
        RegistrationView()
    }
}
