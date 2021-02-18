//
//  LoginHome.swift
//  Blooming
//
//  Created by 김혜빈 on 2021/02/06.
//

import UIKit

protocol LogoutHomeProtocol: class {
    func clickLoginButton()
}

class LogoutHome: UIView {
    private let imageView = UIImageView(image: UIImage(named: "ic_empty_flower")!)
    private let basicLabel = UILabel()
        .then {
            $0.attributedText = NSAttributedString(string: "꽃을 생성하고 싶다면 환경보호\n활동을 실천해보세요", attributes: [
                .font: UIFont.spoqaMedium(14),
                .foregroundColor: UIColor(named: "grey02")!,
                .kern: -0.14
              ])
            $0.numberOfLines = 0
            $0.textAlignment = .center
        }
    let loginButton = UIButton()
    
    weak var delegate: LogoutHomeProtocol?

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
    
    @objc func clickLoginButton(_ sender: UIButton) {
        delegate?.clickLoginButton()
    }

}

// MARK: +UI
extension LogoutHome {
    // MARK: ImageView
    private func setupImageView() {
        imageView.contentMode = .scaleAspectFit
        self.addSubview(imageView)
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.topAnchor.constraint(equalTo: self.topAnchor, constant: 126).isActive = true
        imageView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -276).isActive = true
        imageView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 69).isActive = true
        imageView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -69).isActive = true
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
        loginButton.setImage(UIImage(named: "ic_btn_login")!, for: .normal)
        loginButton.addTarget(self, action: #selector(clickLoginButton(_:)), for: .touchUpInside)
        self.addSubview(loginButton)
        
        loginButton.translatesAutoresizingMaskIntoConstraints = false
        loginButton.widthAnchor.constraint(equalToConstant: 97).isActive = true
        loginButton.heightAnchor.constraint(equalToConstant: 48).isActive = true
        loginButton.topAnchor.constraint(equalTo: basicLabel.bottomAnchor, constant: 35).isActive = true
        loginButton.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
    }
}
