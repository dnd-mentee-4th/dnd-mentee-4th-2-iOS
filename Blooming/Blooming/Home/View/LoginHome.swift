//
//  LoginHome.swift
//  Blooming
//
//  Created by 김혜빈 on 2021/02/06.
//

import UIKit

class LoginHome: UIView {
    // todo - 이미지 소스 수정 필요
    let imageView = UIImageView(image: UIImage(named: "ic_quiz")!)
    let basicLabel = UILabel()
        .then {
            $0.text = "꽃을 생성하고 싶다면 환경보호\n활동을 실천해보세요"
            $0.textColor = UIColor(named: "grey02")!
            $0.font = UIFont.systemFont(ofSize: 14)
            $0.numberOfLines = 0
            $0.textAlignment = .center
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
    }

}

// MARK: +UI
extension LoginHome {
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
}
