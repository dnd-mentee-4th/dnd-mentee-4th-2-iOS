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
    let forgotButton = UIButton()
    let forgotUnderLine = UIView()
    let signInButton = UIButton()
    var signInButtonBottom: NSLayoutConstraint?

    // MARK: override
    override func viewDidLoad() {
        super.viewDidLoad()

        setupView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        bindViewModel()
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
        setupForgotButton()
        setupForgotUnderLine()
        setupSignInButton()
    }
    
    func bindViewModel() {
        passwordField.rx.text.orEmpty
            .bind(to: viewModel!.input.password)
            .disposed(by: disposeBag)
        
        viewModel?.output.isEnableSignInButton.subscribe(onNext: { [weak self] value in
            self?.signInButton.isEnabled = value
            self?.signInButton.backgroundColor = value ? UIColor(named: "peachyPinkTwo")! : UIColor(named: "grey04")!
        }).disposed(by: disposeBag)
        
        viewModel?.output.isSuccessSignIn.subscribe(onNext: { [weak self] value in
            if value {
                self?.navigationController?.dismiss(animated: true, completion: nil)
                return
            }
            self?.setupValidateFailView()
        }).disposed(by: disposeBag)
    }
    
    private func setupValidateFailView() {
        passwordField.text = ""
        signInButton.isEnabled = false
        signInButton.backgroundColor = UIColor(named: "grey04")!
        wrongLabel.isHidden = false
        forgotButton.isHidden = false
        forgotUnderLine.isHidden = false
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
        self.view.endEditing(true)
        viewModel?.requestSignIn()
    }

}
