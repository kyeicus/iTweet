//
//  Tweet.swift
//  iTweet
//
//  Created by Emmanuel K. Nketia on 03/06/2022.
//

import Firebase
import FirebaseFirestoreSwift

struct Tweet: Identifiable, Decodable {
    @DocumentID var id: String?
    let caption: String
    let timestamp: Timestamp
    let uid: String
    var likes: Int
    
    var user: User?
    var didLike: Bool? = false
}
