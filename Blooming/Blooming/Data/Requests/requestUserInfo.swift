//
//  requestUserInfo.swift
//  Blooming
//
//  Created by 김혜빈 on 2021/02/22.
//

import Alamofire
import RxSwift

func requestUserInfo(token: String) -> Observable<UserResponse> {
    return Observable.create { observable in
        let request = AF.request(
            "\(URLString.user)/\(token)",
            method: .get,
            encoding: URLEncoding.default
        )
        .responseJSON { json in
            guard let data = json.data else { return }
            guard let response = try? JSONDecoder().decode(UserResponse.self, from: data) else {
                print("🚫 request user info - response is nil")
                return
            }
            observable.onNext(response)
        }
        return Disposables.create {
            request.cancel()
        }
    }
}
