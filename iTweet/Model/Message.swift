//
//  Message.swift
//  iTweet
//
//  Created by Emmanuel K. Nketia on 11/06/2022.
//

import Foundation

struct Message: Identifiable, Codable {
    var id: String
    var text: String
    var timeStamp: Date
    var received: Bool
}
