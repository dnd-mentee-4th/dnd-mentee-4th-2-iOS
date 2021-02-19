//
//  SignInViewModel.swift
//  Blooming
//
//  Created by 김혜빈 on 2021/02/19.
//

import Foundation
import RxSwift
import RxCocoa

class SignInViewModel {
    let input = Input()
    let output = Output()
    
    struct Input {
        let email = PublishSubject<String>()
        let password = PublishSubject<String>()
    }
    
    struct Output {
        let isEnableNextButton = BehaviorRelay<Bool>(value: false)
        let isEnableSignInButton = BehaviorRelay<Bool>(value: false)
        let isHiddenWrongLabel = BehaviorRelay<Bool>(value: true)
        let isHiddenForgotPasswordButton = BehaviorRelay<Bool>(value: true)
    }
}
