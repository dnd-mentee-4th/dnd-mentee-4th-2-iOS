//
//  CommonViewController.swift
//  Blooming
//
//  Created by 김혜빈 on 2021/02/19.
//

import UIKit

class CommonViewController: UIViewController {
    let baseLabel = UILabel().then {
        $0.attributedText = NSAttributedString(string: "반가워요 :)", attributes: [
            .font: UIFont.spoqaBold(26),
            .foregroundColor: UIColor(named: "black")!,
            .kern: -0.26
          ])
    }
    let signUpButton = UIButton().then {
        $0.setAttributedTitle(NSAttributedString(string: "피어나 회원가입", attributes: [
            .font: UIFont.spoqaBold(15),
            .foregroundColor: UIColor(named: "textPink")!,
            .kern: -0.15
        ]), for: .normal)
        $0.layer.cornerRadius = 24
        $0.layer.borderWidth = 1
        $0.layer.borderColor = UIColor(named: "peachyPinkTwo")!.cgColor
    }
    let beforeSignInButton = UIButton().then {
        $0.setAttributedTitle(NSAttributedString(string: "로그인 전 둘러보기", attributes: [
            .font: UIFont.spoqaRegular(14),
            .foregroundColor: UIColor(named: "greyishBrown")!,
            .kern: -0.14
        ]), for: .normal)
    }
    let underLine = UIView().then {
        $0.backgroundColor = UIColor(named: "greyishBrown")!
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        setupView()
    }
    
    func setupView() {
        self.view.backgroundColor = UIColor(named: "white02")!
        setupBaseLabel()
        setupBeforeSignInButton()
        setupUnderLine()
        setupSignUpButton()
    }
    
    @objc func clickSignUpButton(_ sender: UIButton) {
        // todo
    }
    
    @objc func clickBeforeSignInButton(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }

}

// MARK: +UI
extension CommonViewController {
    // MARK: Base Label
    private func setupBaseLabel() {
        self.view.addSubview(baseLabel)
        
        baseLabel.translatesAutoresizingMaskIntoConstraints = false
        baseLabel.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 72).isActive = true
        baseLabel.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 21).isActive = true
    }
    
    // MARK: SignUp Button
    func setupSignUpButton() {
        signUpButton.addTarget(self, action: #selector(clickSignUpButton(_:)), for: .touchUpInside)
        self.view.addSubview(signUpButton)
        
        signUpButton.translatesAutoresizingMaskIntoConstraints = false
        signUpButton.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width - 40).isActive = true
        signUpButton.heightAnchor.constraint(equalToConstant: 48).isActive = true
        signUpButton.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        signUpButton.bottomAnchor.constraint(equalTo: beforeSignInButton.topAnchor, constant: -13).isActive = true
    }
    
    // MARK: Before SignIn Button
    private func setupBeforeSignInButton() {
        beforeSignInButton.addTarget(self, action: #selector(clickBeforeSignInButton(_:)), for: .touchUpInside)
        self.view.addSubview(beforeSignInButton)
        
        beforeSignInButton.translatesAutoresizingMaskIntoConstraints = false
        beforeSignInButton.heightAnchor.constraint(equalToConstant: 47).isActive = true
        beforeSignInButton.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        beforeSignInButton.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: -32).isActive = true
    }
    
    private func setupUnderLine() {
        self.view.addSubview(underLine)
        
        underLine.translatesAutoresizingMaskIntoConstraints = false
        underLine.widthAnchor.constraint(equalToConstant: 114).isActive = true
        underLine.heightAnchor.constraint(equalToConstant: 1).isActive = true
        underLine.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        underLine.bottomAnchor.constraint(equalTo: beforeSignInButton.bottomAnchor, constant: -12).isActive = true
    }
}
