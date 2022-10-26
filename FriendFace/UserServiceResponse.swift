//
//  UserServiceResponse.swift
//  FriendFace
//
//  Created by JooMin Choi on 18/10/2022.
//

import Foundation

struct User: Codable, Identifiable {
    var id: UUID
    var isActive: Bool
    var name: String
    var age: Int
    var company: String
    var email: String
    var address: String
    var about: String
    var registered: Date
    var tags: [String]
    var friends: [Friend]
    
    struct Friend: Codable {
        var id: UUID
        var name: String
    }
}
