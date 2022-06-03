//
//  ExploreViewModel.swift
//  iTweet
//
//  Created by Emmanuel K. Nketia on 02/06/2022.
//

import Foundation

class ExploreViewModel: ObservableObject {
    @Published var users = [User]()
    @Published var searchText = ""
    
    var searchableUsers: [User] {
        if searchText.isEmpty {
            return users
            
        } else {
            let lowercasedQuery = searchText.lowercased()
            
            return users.filter( {
                $0.username.contains(lowercasedQuery) ||
                $0.FirstName.lowercased().contains(lowercasedQuery) ||
                $0.Lastname.lowercased().contains(lowercasedQuery)
            })
        }
    }
    
    let service = UserService()
    
    init() {
        fetchUsers()
    }
    
    func fetchUsers() {
        service.fetchUsers { users in
            self.users = users
        }
    }
}
