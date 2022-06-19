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
    case media
    case likes
    
    var tittle: String {
        switch self {
        case .tweets:
            return "Tweets"
        case .replies:
            return "Tweets&replies"
        case .likes:
            return "Likes"
        case .media:
            return "Media"
        }
    }
}
