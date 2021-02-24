//
//  UserResponse.swift
//  Blooming
//
//  Created by 김혜빈 on 2021/02/22.
//

import Foundation

struct UserResponse: Codable {
    var error: String?
    var profileImage: String?
    var point: Int?
    var level: Int?
    var badge: [Int]?
    var repBadge: Int?
    var id: String?
    var email: String?
    var password: String?
    var nick: String?
    var mission: [MissionInfo]?
    var activity: [ActivityInfo]?
    var createdDate: String?
    var updatedDate: String?
//    var v: Int
    
    enum CodingKeys: String, CodingKey {
        case id = "_id"
        case createdDate = "createdAt"
        case updatedDate = "updatedAt"
//        case v = "__v"
        case profileImage, point, level, badge, repBadge, email, password, nick, mission, activity
    }
}
