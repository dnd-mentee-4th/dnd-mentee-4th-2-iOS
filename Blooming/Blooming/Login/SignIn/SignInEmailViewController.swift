//
//  SignInViewController.swift
//  Blooming
//
//  Created by 김혜빈 on 2021/02/19.
//

import UIKit

class SignInEmailViewController: UIViewController {
    let welcomeLabel = UILabel().then {
        $0.attributedText = NSAttributedString(string: "반가워요 :)", attributes: [
            .font: UIFont.spoqaBold(26),
            .foregroundColor: UIColor(named: "black")!,
            .kern: -0.26
          ])
    }
    let baseLabel = UILabel().then {
        $0.attributedText = NSAttributedString(string: "꽃을 피우러 가볼까요?", attributes: [
            .font: UIFont.spoqaRegular(15),
            .foregroundColor: UIColor(named: "grey03")!,
            .kern: -0.15
          ])
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        setupView()
    }
    
    func setupView() {
        self.view.backgroundColor = UIColor(named: "white02")!
        setupWelcomeLabel()
        setupBaseLabel()
    }

}

// MARK: +UI
extension SignInEmailViewController {
    // MARK: Welcome Label
    func setupWelcomeLabel() {
        self.view.addSubview(welcomeLabel)
        
        welcomeLabel.translatesAutoresizingMaskIntoConstraints = false
        welcomeLabel.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 72).isActive = true
        welcomeLabel.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 21).isActive = true
    }
    
    // MARK: Base Label
    func setupBaseLabel() {
        self.view.addSubview(baseLabel)
        
        baseLabel.translatesAutoresizingMaskIntoConstraints = false
        baseLabel.topAnchor.constraint(equalTo: welcomeLabel.bottomAnchor, constant: 8).isActive = true
        baseLabel.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 21).isActive = true
    }
}
