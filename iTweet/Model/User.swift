//
//  User.swift
//  iTweet
//
//  Created by Emmanuel K. Nketia on 02/06/2022.
//

import FirebaseFirestoreSwift

struct User: Identifiable, Decodable {
    @DocumentID var id: String?
    let username: String
    let FirstName : String
    let email: String
    let profileImageUrl: String
    let Lastname: String
}
