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
    let emailField = UITextField().then {
        $0.attributedPlaceholder = NSAttributedString(string: "이메일", attributes: [
            .font: UIFont.spoqaMedium(18),
            .foregroundColor: UIColor(named: "grey05")!,
            .kern: -0.18
          ])
        $0.clearButtonMode = .whileEditing
        $0.font = .spoqaMedium(18)
        $0.textColor = UIColor(named: "black")!
    }
    let underLine = UIView().then {
        $0.backgroundColor = UIColor(named: "grey04")!
    }
    let nextButton = UIButton().then {
        $0.setAttributedTitle(NSAttributedString(string: "계속하기", attributes: [
            .font: UIFont.spoqaBold(15),
            .foregroundColor: UIColor.white,
            .kern: -0.15
        ]), for: .normal)
        $0.backgroundColor = UIColor(named: "peachyPinkTwo")!
        $0.layer.cornerRadius = 24
    }
    var nextButtonBottom: NSLayoutConstraint?

    override func viewDidLoad() {
        super.viewDidLoad()

        setupView()
    }
    
    func setupView() {
        self.view.backgroundColor = UIColor(named: "white02")!
        setupWelcomeLabel()
        setupBaseLabel()
        setupEmailField()
        setupUnderLine()
        setupNextButton()
    }
    
    func setupNextButtonOnBottom() {
        guard let bottom = nextButtonBottom else { return }
        bottom.constant = -60
    }
    
    func setupNextButtonOnKeyboard() {
        guard let bottom = nextButtonBottom else { return }
        bottom.constant = -60 - 291 // 키보드 높이 구하기
    }
    
    @objc func clickNextButton(_ sender: UIButton) {
        // todo
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
    
    // MARK: Email Field
    func setupEmailField() {
        self.view.addSubview(emailField)
        
        emailField.translatesAutoresizingMaskIntoConstraints = false
        emailField.topAnchor.constraint(equalTo: baseLabel.bottomAnchor, constant: 78).isActive = true
        emailField.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 21).isActive = true
        emailField.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -21).isActive = true
    }
    
    func setupUnderLine() {
        self.view.addSubview(underLine)
        
        underLine.translatesAutoresizingMaskIntoConstraints = false
        underLine.heightAnchor.constraint(equalToConstant: 1).isActive = true
        underLine.topAnchor.constraint(equalTo: emailField.bottomAnchor, constant: 8).isActive = true
        underLine.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 21).isActive = true
        underLine.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -21).isActive = true
    }
    
    func setupNextButton() {
        nextButton.addTarget(self, action: #selector(clickNextButton(_:)), for: .touchUpInside)
        self.view.addSubview(nextButton)
        
        nextButton.translatesAutoresizingMaskIntoConstraints = false
        nextButton.heightAnchor.constraint(equalToConstant: 48).isActive = true
        nextButtonBottom = nextButton.bottomAnchor.constraint(equalTo: self.view.bottomAnchor)
        nextButtonBottom?.isActive = true
        nextButton.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 21).isActive = true
        nextButton.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -21).isActive = true
        
        setupNextButtonOnBottom()
    }
}
