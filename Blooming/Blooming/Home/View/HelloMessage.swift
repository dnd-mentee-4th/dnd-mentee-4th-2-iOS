//
//  HelloMessage.swift
//  Blooming
//
//  Created by 김혜빈 on 2021/02/22.
//

import UIKit

class HelloMessage: UIView {
    let label = UILabel()

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        setupView()
    }
    
    func setupView() {
        self.backgroundColor = UIColor(named: "peachyPinkTwo")!
        
        setupLabel()
    }
    
    func setupLabel() {
        self.addSubview(label)
        
        label.translatesAutoresizingMaskIntoConstraints = false
        label.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        label.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -15).isActive = true
    }
    
    func setNickname(_ nick: String) {
        label.attributedText = NSAttributedString(string: "\(nick) 님, 반가워요!", attributes: [
            .font: UIFont.spoqaBold(15),
            .foregroundColor: UIColor.white,
            .kern: -0.15
        ])
    }
}
