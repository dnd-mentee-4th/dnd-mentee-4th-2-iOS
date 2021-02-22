//
//  ActivityInfo.swift
//  Blooming
//
//  Created by 김혜빈 on 2021/02/22.
//

import Foundation

struct ActivityInfo: Codable {
    var id: Int
    var imageUrl: String
    var dateTime: Date
    var missionType: String
    
    enum CodingKeys: String, CodingKey {
        case imageUrl = "url"
        case id, dateTime, missionType
    }
}
