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
    let input = Input()
    let output = Output()
    
    struct Input {
        let eRecipt = PublishRelay<Void>()
        let multiUse = PublishRelay<Void>()
        let separateGarbage = PublishRelay<Void>()
        let waterSave = PublishRelay<Void>()
        let eco = PublishRelay<Void>()
    }
    
    struct Output {
        let loginStatus = BehaviorRelay<Bool>(value: false)
        // todo - tab에 따른 flower 정보
    }
    
    init() {
        Observable.of(input.eRecipt.asObservable(), input.multiUse.asObservable(), input.separateGarbage.asObservable(), input.waterSave.asObservable(), input.eco.asObservable()).merge().subscribe { _ in
            // todo - 사용자 정보 요청 및 꽃 정보만 받아와서 output 해주기
        }.disposed(by: disposeBag)
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
}
