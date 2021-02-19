//
//  SignInPasswordViewController.swift
//  Blooming
//
//  Created by 김혜빈 on 2021/02/19.
//

import UIKit
import RxSwift

class SignInPasswordViewController: UIViewController {
    private let disposeBag = DisposeBag()
    var viewModel: SignInViewModel?

    override func viewDidLoad() {
        super.viewDidLoad()

        setupView()
    }
    
    func setupView() {
        self.view.backgroundColor = UIColor(named: "white02")!
        
    }

}
