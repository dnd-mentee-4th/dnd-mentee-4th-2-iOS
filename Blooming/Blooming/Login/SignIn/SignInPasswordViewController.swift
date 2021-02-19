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
    let passwordField = UITextField()
    let underLine = UIView()
    let wrongLabel = UILabel()
    
    let signInButton = UIButton()
    var signInButtonBottom: NSLayoutConstraint?

    // MARK: override
    override func viewDidLoad() {
        super.viewDidLoad()

        setupView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(_:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide(_:)), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        NotificationCenter.default.removeObserver(self)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    func setupView() {
        self.view.backgroundColor = UIColor(named: "white02")!
        
        setupBackButton()
        setupWelcomeLabel()
        setupBaseLabel()
        setupPasswordField()
        setupUnderLine()
        setupWrongLabel()
        setupSignInButton()
    }
    
    // MARK: objc func
    @objc func keyboardWillShow(_ notification: NSNotification) {
        guard let bottom = signInButtonBottom else { return }
        if let keyboardFrame: NSValue = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue {
            let keyboardRectangle = keyboardFrame.cgRectValue
            let keyboardHeight = keyboardRectangle.height
            
            DispatchQueue.main.async {
                bottom.constant = -16 - keyboardHeight
            }
        }
    }
    
    @objc func keyboardWillHide(_ notification: NSNotification) {
        guard let bottom = signInButtonBottom else { return }
        DispatchQueue.main.async {
            bottom.constant = -60
        }
    }
    
    @objc func clickBackButton(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @objc func clickSignInButton(_ sender: UIButton) {
        viewModel?.requestSignIn()
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
    
    // MARK: Password Field
    func setupPasswordField() {
        passwordField.attributedPlaceholder = NSAttributedString(string: "비밀번호", attributes: [
            .font: UIFont.spoqaMedium(18),
            .foregroundColor: UIColor(named: "grey05")!,
            .kern: -0.18
          ])
        passwordField.clearButtonMode = .whileEditing
        passwordField.font = .spoqaMedium(18)
        passwordField.textColor = UIColor(named: "black")!
        passwordField.isSecureTextEntry = true
        self.view.addSubview(passwordField)
        
        passwordField.translatesAutoresizingMaskIntoConstraints = false
        passwordField.topAnchor.constraint(equalTo: baseLabel.bottomAnchor, constant: 78).isActive = true
        passwordField.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 21).isActive = true
        passwordField.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -21).isActive = true
    }
    
    func setupUnderLine() {
        underLine.backgroundColor = UIColor(named: "grey04")!
        self.view.addSubview(underLine)
        
        underLine.translatesAutoresizingMaskIntoConstraints = false
        underLine.heightAnchor.constraint(equalToConstant: 1).isActive = true
        underLine.topAnchor.constraint(equalTo: passwordField.bottomAnchor, constant: 8).isActive = true
        underLine.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 21).isActive = true
        underLine.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -21).isActive = true
    }
    
    // MARK: Wrong Label
    func setupWrongLabel() {
        wrongLabel.attributedText = NSAttributedString(string: "이메일 혹은 비밀번호가 틀렸어요", attributes: [
            .font: UIFont.spoqaRegular(14),
            .foregroundColor: UIColor.systemRed,
            .kern: -0.14
        ])
        self.view.addSubview(wrongLabel)
        
        wrongLabel.translatesAutoresizingMaskIntoConstraints = false
        wrongLabel.topAnchor.constraint(equalTo: underLine.bottomAnchor, constant: 30).isActive = true
        wrongLabel.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
    }
    
    // MARK: SignIn Button
    func setupSignInButton() {
        signInButton.setAttributedTitle(NSAttributedString(string: "로그인", attributes: [
            .font: UIFont.spoqaBold(15),
            .foregroundColor: UIColor.white,
            .kern: -0.15
        ]), for: .normal)
        signInButton.backgroundColor = UIColor(named: "peachyPinkTwo")!
        signInButton.layer.cornerRadius = 24
        signInButton.addTarget(self, action: #selector(clickSignInButton(_:)), for: .touchUpInside)
        self.view.addSubview(signInButton)
        
        signInButton.translatesAutoresizingMaskIntoConstraints = false
        signInButton.heightAnchor.constraint(equalToConstant: 48).isActive = true
        signInButtonBottom = signInButton.bottomAnchor.constraint(equalTo: self.view.bottomAnchor)
        signInButtonBottom?.constant = -60
        signInButtonBottom?.isActive = true
        signInButton.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 21).isActive = true
        signInButton.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -21).isActive = true
    }
}
