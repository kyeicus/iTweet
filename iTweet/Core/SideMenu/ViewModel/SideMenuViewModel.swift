//
//  SideMenuViewModel.swift
//  iTweet
//
//  Created by Emmanuel K. Nketia on 26/05/2022.
//

import Foundation

enum SideMenuViewModel: Int, CaseIterable {
    case profile
    case lists
    case bookmarks
    case topic
    case moments
    case purchases
    case monitization
    case logout
    
    var title: String {
        switch self {
        case .profile:
            return "Profile"
        case .lists:
            return "Lists"
        case .bookmarks:
            return "Bookmarks"
        case .logout:
            return "Logout"
        case .topic:
            return "Topic"
        case .moments:
            return "Moments"
        case .purchases:
            return "Purchases"
        case .monitization:
            return "Monitization"
        }
    }
    var imageName: String {
        switch self {
        case .profile:
            return "person"
        case .lists:
            return "list.bullet"
        case .bookmarks:
            return "bookmark"
        case .logout:
            return "arrow.left.square"
        case .topic:
            return "text.bubble"
        case .moments:
            return "bolt.fill"
        case .purchases:
            return "cart"
        case .monitization:
            return "creditcard"
        }
    }
}
