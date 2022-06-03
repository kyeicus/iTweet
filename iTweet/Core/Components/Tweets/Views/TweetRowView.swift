//
//  TweetRowView.swift
//  iTweet
//
//  Created by Emmanuel K. Nketia on 09/05/2022.
//

import SwiftUI
import Kingfisher

struct TweetRowView: View {
    @ObservedObject var viewModel : TweetRowViewModel
    init (tweet: Tweet) {
        self.viewModel = TweetRowViewModel(tweet: tweet)
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            if let user = viewModel.tweet.user{
                HStack(alignment: .top, spacing: 12){
                    KFImage(URL(string: user.profileImageUrl))
                        .resizable()
                        .scaledToFill()
                        .frame(width: 56, height: 56)
                        .clipShape(Circle() )
                    
                    //                User infor & Tweet cation
                    VStack(alignment: .leading, spacing: 4) {
                        //                    User info
                        if let  user = viewModel.tweet.user{
                            HStack {
                                Text("\(user.FirstName) \(user.Lastname)")
                                    .font(.subheadline).bold()
                                
                                Text("\(user.username)")
                                    .foregroundColor(.gray)
                                    .font(.caption)
                                
                                Text("2W")
                                    .foregroundColor(.gray)
                                    .font(.caption)
                            }
                        }
                        //Tweet caption
                        
                        Text(viewModel.tweet.caption)
                            .font(.subheadline)
                            .multilineTextAlignment(.leading)
                    }
                }
            }
            
            HStack {
                Button {
                    
                } label: {
                    Image(systemName: "bubble.left")
                        .font(.subheadline)
                }
                Spacer()
                Button {
                    
                } label: {
                    Image(systemName: "arrow.2.squarepath")
                        .font(.subheadline)
                }
                Spacer()
                Button {
                    viewModel.tweet.didLike ?? false ?
                    viewModel.unLikeTweet() :
                    viewModel.likeTweet()
                } label: {
                    Image(systemName: viewModel.tweet.didLike ?? false ? "heart.fill" : "heart")
                        .font(.subheadline)
                        .foregroundColor(viewModel.tweet.didLike ?? false ? .red : .gray )
                }
                Spacer()
                Button {
                    
                } label: {
                    Image(systemName: "bookmark")
                        .font(.subheadline)
                }
                
            }
            .padding()
            .foregroundColor(.gray)
            Divider()
        }
    }
}

