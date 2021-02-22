//
//  MissionInfo.swift
//  Blooming
//
//  Created by 김혜빈 on 2021/02/22.
//

import Foundation

struct MissionInfo: Codable {
    var level: Int
    var currentScore: Int
    var totalScore: Int
    var id: String
    var missionType: String
    
    enum CodingKeys: String, CodingKey {
        case id = "_id"
        case level, currentScore, totalScore, missionType
    }
}
