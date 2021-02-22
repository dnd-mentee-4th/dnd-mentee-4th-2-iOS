//
//  URLString.swift
//  Blooming
//
//  Created by 김혜빈 on 2021/02/21.
//

import Foundation

struct URLString {
    static private let baseUrl: String = "http://ec2-13-124-120-203.ap-northeast-2.compute.amazonaws.com"
    static let login: String = "\(baseUrl)/api/signin"
    static let signup: String = "\(baseUrl)/api/signup"
    static let user: String = "\(baseUrl)/api/user"
}
