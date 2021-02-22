//
//  HomeViewModel.swift
//  Blooming
//
//  Created by 김혜빈 on 2021/02/22.
//

import RxSwift
import RxCocoa

class HomeViewModel {
    let disposeBag = DisposeBag()
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
        input.eRecipt.subscribe(onNext: { [weak self] in
            self?.requestFlowers(type: MissionType.eRecipt)
        }).disposed(by: disposeBag)
        input.multiUse.subscribe(onNext: { [weak self] in
            self?.requestFlowers(type: MissionType.eRecipt)
        }).disposed(by: disposeBag)
        input.separateGarbage.subscribe(onNext: { [weak self] in
            self?.requestFlowers(type: MissionType.eRecipt)
        }).disposed(by: disposeBag)
        input.waterSave.subscribe(onNext: { [weak self] in
            self?.requestFlowers(type: MissionType.eRecipt)
        }).disposed(by: disposeBag)
        input.eco.subscribe(onNext: { [weak self] in
            self?.requestFlowers(type: MissionType.eRecipt)
        }).disposed(by: disposeBag)
    }
    
    func requestFlowers(type: MissionType) {
        // todo
    }
    
    func requestLoginStatus() {
        // todo
    }
}
