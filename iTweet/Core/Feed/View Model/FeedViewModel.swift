//
//  FeedViewModel.swift
//  iTweet
//
//  Created by Emmanuel K. Nketia on 03/06/2022.
//
import SwiftUI
import Foundation

class FeedViewModel: ObservableObject {
    @Published var tweets = [Tweet]()
    let service = TweetService()
    let userService = UserService()
    
    init() {
        fetchTweet()
    }
    
    func fetchTweet() {
        service.fetchTweet { tweets in
            self.tweets = tweets
            
            for i in 0 ..< tweets.count {
                let uid = tweets[i].uid
                
                self.userService.fetchUser(withUid: uid) { user in
                    self.tweets[i].user = user
                    
                }
            }
        }
    }
}
