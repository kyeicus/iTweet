//
//  NewTweetView.swift
//  iTweet
//
//  Created by Emmanuel K. Nketia on 26/05/2022.
//

import SwiftUI

struct NewTweetView: View {
    @State private var caption = ""
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        VStack {
            HStack {
                Button  {
                    presentationMode.wrappedValue.dismiss()
                    
                } label: {
                    Text ("Cancel")
                        .foregroundColor(Color(.systemBlue))
                }
                Spacer()
                Button  {
                    print("Tweeted")
                } label: {
                    Text ("Tweet")
                        .bold()
                        .padding(.horizontal)
                        .padding(.vertical , 8)
                        .background(Color(.systemBlue))
                        .foregroundColor(.white)
                        .clipShape(Capsule())
                }
                
            }
            .padding()
            HStack(alignment: .top) {
                Circle()
                    .frame(width: 64, height: 64)
                
                TextArea("What's happening", text: $caption)
            }
            .padding()
        }
        
    }
}

struct NewTweetView_Previews: PreviewProvider {
    static var previews: some View {
        NewTweetView()
    }
}
