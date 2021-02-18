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
