//
//  LoginHome.swift
//  Blooming
//
//  Created by 김혜빈 on 2021/02/06.
//

import UIKit

class LogoutHome: UIView {
    // todo - 이미지 소스 수정 필요
    private let imageView = UIImageView(image: UIImage(named: "ic_quiz")!)
    private let basicLabel = UILabel()
        .then {
            $0.text = "꽃을 생성하고 싶다면 환경보호\n활동을 실천해보세요"
            $0.textColor = UIColor(named: "grey02")!
            $0.font = UIFont.systemFont(ofSize: 14)
            $0.numberOfLines = 0
            $0.textAlignment = .center
        }
    let loginButton = UIButton()
        .then {
            $0.backgroundColor = UIColor(named: "peachyPinkTwo")!
            $0.layer.cornerRadius = 24
            $0.setTitle("로그인하기", for: .normal)
            $0.setTitleColor(.white, for: .normal)
            $0.titleEdgeInsets = UIEdgeInsets(top: 16, left: 16, bottom: 16, right: 16)
        }

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        setupView()
    }
    
    func setupView() {
        setupImageView()
        setupBasicLabel()
        setupLoginButton()
    }

}

// MARK: +UI
extension LogoutHome {
    // MARK: ImageView
    private func setupImageView() {
        self.addSubview(imageView)
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.topAnchor.constraint(equalTo: self.topAnchor, constant: 165).isActive = true
        imageView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -242).isActive = true
        imageView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 73).isActive = true
        imageView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 65).isActive = true
    }
    
    // MARK: BasicLabel
    private func setupBasicLabel() {
        self.addSubview(basicLabel)
        
        basicLabel.translatesAutoresizingMaskIntoConstraints = false
        basicLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 32).isActive = true
        basicLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
    }
    
    // MARK: Login Button
    private func setupLoginButton() {
        self.addSubview(loginButton)
        
        loginButton.translatesAutoresizingMaskIntoConstraints = false
        loginButton.widthAnchor.constraint(equalToConstant: 97).isActive = true
        loginButton.heightAnchor.constraint(equalToConstant: 48).isActive = true
        loginButton.topAnchor.constraint(equalTo: basicLabel.bottomAnchor, constant: 15).isActive = true
        loginButton.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
    }
}
