//
//  TweetRowView.swift
//  iTweet
//
//  Created by Emmanuel K. Nketia on 09/05/2022.
//

import SwiftUI
import Kingfisher
import FirebaseFirestoreSwift


struct TweetRowView: View {
    @ObservedObject var viewModel : TweetRowViewModel
    @State var dislike = false
    init (tweet: Tweet) {
        self.viewModel = TweetRowViewModel(tweet: tweet)
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            if let user = viewModel.tweet.user{
                HStack(alignment: .top){
                    KFImage(URL(string: user.profileImageUrl))
                        .resizable()
                        .scaledToFill()
                        .frame(width: 56, height: 56)
                        .clipShape(Circle() )
                        .padding(.top)
                        .padding(.trailing, 5)
                    
                    //                User infor & Tweet cation
                    VStack(alignment: .leading) {
                        //                    User info
                        if let  user = viewModel.tweet.user{
                            HStack {
                                Text("\(user.FirstName) \(user.Lastname)")
                                    .font(.subheadline).bold()
                                    .lineLimit(1)
                                
                                Text("@\(user.username) • \(viewModel.tweet.timestamp.dateValue().formatted(date: .omitted, time: .shortened.self))" )
                                    .foregroundColor(.gray)
                                    .font(.caption)
                                    .truncationMode(.middle)
                                    .lineLimit(1)
                            }
                            .padding(.top, 5)
                        }
                        //Tweet caption
                        
                        Text(viewModel.tweet.caption)
                            .lineLimit(nil)
                            .multilineTextAlignment(.leading)
                        
                        HStack {
                            Button {} label: {
                                Image(systemName: "bubble.left")
                                    .font(.subheadline)
                            }
                            Spacer()
                            Button {} label: {
                                Image(systemName: "arrow.2.squarepath")
                                    .font(.subheadline)
                            }
                            Spacer()
                            Button {
                                viewModel.tweet.didLike ?? false ?
                                viewModel.unLikeTweet() :
                                viewModel.likeTweet()
                                dislike = false
                            } label: {
                                Image(systemName: viewModel.tweet.didLike ?? false ? "hand.thumbsup.fill" : "hand.thumbsup")
                                    .font(.subheadline)
                                    .foregroundColor(viewModel.tweet.didLike ?? false ? .red : .gray )
                                Text("\(viewModel.tweet.likes)")
                            }
                            Spacer()
                            Button {
                                dislike.toggle()
                                viewModel.unLikeTweet()
                            } label: {
                                Image(systemName: dislike ? "hand.thumbsdown.fill" : "hand.thumbsdown")
                                    .font(.subheadline)
                                    .foregroundColor(dislike ? .red : .gray )
                            }
                            Spacer()
                  
                            if #available(iOS 16.0, *) {
                                ShareLink(item: viewModel.tweet.caption, preview: SharePreview(
                                    viewModel.tweet.caption
                                   
                                    
                                )) {
                                      Label("", systemImage: "square.and.arrow.up")
                                  }
                                
                            } else {
                                // Fallback on earlier versions
                                Button {
                                    print("Share......")
                                } label: {
                                    Image(systemName: "square.and.arrow.up")
                                        .font(.subheadline)
                                }

                            }
                           
                        
                        }
                        .foregroundColor(.gray)
                        .padding([.bottom, .top], 10)
                        .padding(.trailing, 30)
                    }
                }
            }
            Divider()
        }
    }
}

