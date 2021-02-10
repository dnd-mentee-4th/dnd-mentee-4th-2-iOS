//
//  QuizButton.swift
//  Blooming
//
//  Created by 김혜빈 on 2021/01/30.
//

import UIKit

class QuizButton: UIButton {
    let circleProgressBar = CircleProgressBar(frame: CGRect(x: 0, y: 0, width: 56, height: 56))
        .then {
            $0.setProgressWithAnimation(duration: 1.0, value: (20 * 60 + 20) / (24 * 60))
        }
    var currentTime: Float = 20 * 60 + 20 {
        didSet {
            circleProgressBar.setProgressWithAnimation(duration: 1.0, value: currentTime / (24 * 60))
        }
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
        self.addSubview(circleProgressBar)
        
        circleProgressBar.translatesAutoresizingMaskIntoConstraints = false
        circleProgressBar.centerXAnchor.constraint(equalTo: self.centerXAnchor, constant: -28).isActive = true
        circleProgressBar.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: -28).isActive = true
    }
}
