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
    @State private var firstname = ""
    @State private var lastName = ""
    @State private var password = ""
    
    @EnvironmentObject var viewModel :AuthViewModel
    @Environment(\.presentationMode) var presemtationMode
    
    var body: some View {
        
        VStack{
            
            NavigationLink (destination: ProfilePhotoSelectorView(),
                            isActive: $viewModel.didAuthenticateUser,
                            label:  { })
            
            AuthHeaderView(logo: "tweet", title: "Create your Account")
            VStack (spacing: 40) {
                CustomInputField(imageName: "person",
                                 placeholderText: "Userename",
                                 text: $userName)
                .textContentType(.username)
                CustomInputField(imageName: "envelope",
                                 placeholderText: "Email", text: $email)
                .textContentType(.emailAddress)
                .keyboardType(.emailAddress)
                CustomInputField(imageName: "person",
                                 placeholderText: "First Name",
                                 text: $firstname)
                .textContentType(.name)
                CustomInputField(imageName: "person",
                                 placeholderText: "Last Name",
                                 text: $lastName)
                .textContentType(.name)
                CustomInputField(imageName: "lock",
                                 placeholderText: "Password",
                                 isSecureField: true,
                                 text: $password)
                .textContentType(.password)
            }
            .padding(32)
            
            Button  {
                viewModel.register(withEmail: email, userName: userName, firstName: firstname, lastName: lastName, password: password)
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
