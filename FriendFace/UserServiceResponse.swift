//
//  UserServiceResponse.swift
//  FriendFace
//
//  Created by JooMin Choi on 18/10/2022.
//

import Foundation

struct UserServiceResponse: Codable {
    var id: String
    var isActive: Bool
    var name: String
    var age: Int
    var company: String
    var email: String
    var address: String
    var about: String
    var registered: String
    var tags: [String]
    var friends: [Friends]
    
    struct Friends: Codable {
        var id: String
        var name: String
    }
}
