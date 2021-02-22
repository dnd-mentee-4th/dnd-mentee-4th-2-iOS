//
//  LoginResponse.swift
//  Blooming
//
//  Created by 김혜빈 on 2021/02/21.
//

import Foundation

struct LoginResponse: Codable {
    let status: String?
    let error: String?
    let token: String?
}
