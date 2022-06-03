//
//  TweetRowviewModel.swift
//  iTweet
//
//  Created by Emmanuel K. Nketia on 03/06/2022.
//

import Foundation

class TweetRowViewModel:ObservableObject {
    @Published var tweet: Tweet
    private let service = TweetService()
    
    
    init(tweet: Tweet){
        self.tweet = tweet
        checkIfUserLikedTweet()
        
    }
    func likeTweet() {
        service.likeTweet(tweet) {
            self.tweet.didLike = true
        }
    }
    
    func unLikeTweet(){
        service.unLikeTweet(tweet) {
            self.tweet.didLike = false
        }
    }
    
    func checkIfUserLikedTweet() {
        service.checkIfUserLikedTweet(tweet) { didLike in
            if didLike {
                self.tweet.didLike = true
            }
        }
    }
}
