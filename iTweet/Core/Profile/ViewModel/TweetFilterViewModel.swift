//
//  TweetFilterViewModel.swift
//  iTweet
//
//  Created by Emmanuel K. Nketia on 09/05/2022.
//

import Foundation

enum TweetFilterViewModel: Int, CaseIterable {
    case tweets
    case replies
    case likes
    
    var tittle: String {
        switch self {
        case .tweets:
            return "Tweets"
        case .replies:
            return "Replies"
        case .likes:
            return "Likes"
        }
    }
    
}
