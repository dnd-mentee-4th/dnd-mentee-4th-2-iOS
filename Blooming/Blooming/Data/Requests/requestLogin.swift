//
//  requestLogin.swift
//  Blooming
//
//  Created by 김혜빈 on 2021/02/21.
//

import Alamofire
import RxSwift

func requestLogin(_ email: String, _ pw: String) -> Observable<Bool> {
    var request = URLRequest(url: URL(string: URLString.login)!)
    request.httpMethod = "POST"
    request.setValue("application/json", forHTTPHeaderField: "Content-Type")
    request.timeoutInterval = 10
    
    // Codable Model을 Data로 변환
    let requestBody = try? JSONEncoder().encode(LoginBody(email: email, password: pw))
    if let requestBody = requestBody {
        request.httpBody = requestBody
    }
    
    return Observable<Bool>.create { observable in
        let request = AF.request(request).responseString { response in
            switch response.result {
            case .success:
                guard let data = response.data, let item = try? JSONDecoder().decode(LoginResponse.self, from: data) else { return }
                if item.error != nil {
                    print("로그인 에러 발생 - \(String(describing: item.error!))")
                    observable.onNext(false)
                    return
                }
                print("로그인 토큰: \(item.token!)")
                UserDefaults.standard.set(item.token!, forKey: "token")
                observable.onNext(true)
                observable.onCompleted()
            case .failure(let error):
                observable.onNext(false)
                print("🚫 request login - \(error.localizedDescription)")
            }
        }
        return Disposables.create { request.cancel() }
    }
}
