//
//  FeedView.swift
//  iTweet
//
//  Created by Emmanuel K. Nketia on 09/05/2022.
//

import SwiftUI

struct FeedView: View {
    @State private var showNewTweetView = false
    @ObservedObject var viewModel = FeedViewModel()
    
    var body: some View {
        ZStack(alignment: .bottomTrailing) {
            ScrollView{
                LazyVStack{
                    ForEach(viewModel.tweets) { tweet in
                        TweetRowView(tweet: tweet)
                            .padding()
                    }
                    
                }
            
            }
          
            .background(Color(.secondarySystemBackground))
            Button {
                showNewTweetView.toggle()
            } label: {
                Image(systemName: "pencil")
                    .font(.largeTitle)
                    .padding()
            }
            .background(Color(.systemBlue))
            .foregroundColor(.white)
            .mask(Circle ())
            .shadow(radius: 5)
            .fullScreenCover(isPresented: $showNewTweetView) {
                NewTweetView(viewModel: UploadTweetViewModel())
            }
        }
    }
}

struct FeedView_Previews: PreviewProvider {
    static var previews: some View {
        FeedView()
    }
}
