//
//  ProfilePhotoSelectorView.swift
//  iTweet
//
//  Created by Emmanuel K. Nketia on 28/05/2022.
//

import SwiftUI

struct ProfilePhotoSelectorView: View {
    @State private var showImagePicker = false
    @State private var selectedImage = UIImage()
    @State private var profileImage: Image?
    @State private var showSheet = false
    @EnvironmentObject var viewModel: AuthViewModel
    var body: some View {
        VStack {
            AuthHeaderView(logo: "tweet", title: "upload")
            Spacer()
            
            Button  {
                showSheet = true
            } label: {
                Image(uiImage: self.selectedImage)
                    .resizable()
                    .cornerRadius(50)
                    .frame(width: 180, height: 180)
                    .background(Color.black.opacity(0.2))
                    .aspectRatio(contentMode: .fill)
                    .clipShape(Circle())
            }
            .sheet(isPresented: $showSheet) {
                // Pick an image from the photo library:
                ImagePicker(sourceType: .photoLibrary, selectedImage: self.$selectedImage)
                
            }
            if let selectedImage = selectedImage {
                Button {
                    viewModel.uploadProfileImage(selectedImage)
                } label: {
                    Text("Continue")
                        .font(.headline)
                        .foregroundColor(.white)
                        .frame(width: 340, height:  50)
                        .background(Color(.systemBlue))
                        .clipShape(Capsule())
                        .padding()
                }
                .shadow(color: .gray.opacity(0.5), radius: 10, x: 0, y: 0)
                
            }
            Spacer()
        }
        .ignoresSafeArea()
    }
}

struct ProfilePhotoSelectorView_Previews: PreviewProvider {
    static var previews: some View {
        ProfilePhotoSelectorView()
    }
}
