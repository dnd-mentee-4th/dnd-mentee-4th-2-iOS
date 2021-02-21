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
    private let emailValidator = NSPredicate(format: "SELF MATCHES %@", "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}")
    private let passwordValidator = NSPredicate(format: "SELF MATCHES %@", "(?=.*[A-Za-z])(?=.*[0-9]).{8,20}")
    private let disposeBag = DisposeBag()
    private var email: String = ""
    private var password: String = ""
    let input = Input()
    let output = Output()
    
    struct Input {
        let email = PublishSubject<String>()
        let password = PublishSubject<String>()
    }
    
    struct Output {
        let isEnableNextButton = BehaviorRelay<Bool>(value: false)
        let isEnableSignInButton = BehaviorRelay<Bool>(value: false)
        let isSuccessSignIn = PublishRelay<Bool>()
    }
    
    init() {
        input.email.subscribe(onNext: { [weak self] email in
            self?.emailValidate(email)
            self?.email = email
        }).disposed(by: disposeBag)
        
        input.password.subscribe(onNext: { [weak self] pw in
            self?.passwordValidate(pw)
            self?.password = pw
        }).disposed(by: disposeBag)
    }
    
    private func emailValidate(_ email: String) {
        output.isEnableNextButton.accept( emailValidator.evaluate(with: email) )
    }
    
    private func passwordValidate(_ password: String) {
        output.isEnableSignInButton.accept( passwordValidator.evaluate(with: password) )
    }
    
    func requestSignIn() {
        // todo - 성공하면 isSuccessSignIn에 true 발행
        // todo - 성공하지 못하면 isSuccessSignIn에 false 발행, isHiddenWrongLabel과 isHiddenForgotPasswordButton에 false 발행
    }
}
