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
    let backButton = UIButton()
    let welcomeLabel = UILabel()
    let baseLabel = UILabel()

    override func viewDidLoad() {
        super.viewDidLoad()

        setupView()
    }
    
    func setupView() {
        self.view.backgroundColor = UIColor(named: "white02")!
        
        setupBackButton()
        setupWelcomeLabel()
        setupBaseLabel()
    }
    
    @objc func clickBackButton(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }

}

// MARK: +UI
extension SignInPasswordViewController {
    // MARK: Back Button
    func setupBackButton() {
        backButton.setImage(UIImage(named: "ic_btn_back")!, for: .normal)
        backButton.addTarget(self, action: #selector(clickBackButton(_:)), for: .touchUpInside)
        self.view.addSubview(backButton)
        
        backButton.translatesAutoresizingMaskIntoConstraints = false
        backButton.widthAnchor.constraint(equalToConstant: 45).isActive = true
        backButton.heightAnchor.constraint(equalToConstant: 45).isActive = true
        backButton.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor).isActive = true
        backButton.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 10).isActive = true
    }
    
    // MARK: Welcome Label
    func setupWelcomeLabel() {
        welcomeLabel.attributedText = NSAttributedString(string: "반가워요 :)", attributes: [
            .font: UIFont.spoqaBold(26),
            .foregroundColor: UIColor(named: "black")!,
            .kern: -0.26
          ])
        self.view.addSubview(welcomeLabel)
        
        welcomeLabel.translatesAutoresizingMaskIntoConstraints = false
        welcomeLabel.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 72).isActive = true
        welcomeLabel.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 21).isActive = true
    }
    
    // MARK: Base Label
    func setupBaseLabel() {
        baseLabel.attributedText = NSAttributedString(string: "꽃을 피우러 가볼까요?", attributes: [
            .font: UIFont.spoqaRegular(15),
            .foregroundColor: UIColor(named: "grey03")!,
            .kern: -0.15
          ])
        self.view.addSubview(baseLabel)
        
        baseLabel.translatesAutoresizingMaskIntoConstraints = false
        baseLabel.topAnchor.constraint(equalTo: welcomeLabel.bottomAnchor, constant: 8).isActive = true
        baseLabel.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 21).isActive = true
    }
}
