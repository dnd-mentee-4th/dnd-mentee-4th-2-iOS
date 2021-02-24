//
//  HomeViewModel.swift
//  Blooming
//
//  Created by 김혜빈 on 2021/02/22.
//

import RxSwift
import RxCocoa

class HomeViewModel {
    private let disposeBag = DisposeBag()
    var nickname = "(알수없음)"
    let output = Output()
    
    struct Output {
        let loginStatus = BehaviorRelay<Bool>(value: false)
        let flower = BehaviorRelay<[Flower]>(value: [Flower(score: 0), Flower(score: 0), Flower(score: 0), Flower(score: 0), Flower(score: 0)])
    }
    
    func requestLoginStatus() {
        guard let token = UserDefaults.standard.string(forKey: "token") else {
            output.loginStatus.accept(false)
            return
        }
        requestUserInfo(token: token).subscribe(onNext: { [weak self] value in
            self?.nickname = value.nick ?? "(알수없음)"
            if value.error == nil { self?.output.loginStatus.accept(true) } else { self?.output.loginStatus.accept(false) }
        }).disposed(by: disposeBag)
    }
    
    func requestFlowers() {
        // todo - 사용자 정보 요청 및 Flower 정보만 받아와서 output 해주기
        output.flower.accept([Flower(score: 0), Flower(score: 0), Flower(score: 2), Flower(score: 3), Flower(score: 4)])
    }
}
