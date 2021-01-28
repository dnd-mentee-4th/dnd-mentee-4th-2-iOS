//
//  UIButton+.swift
//  EchoNote
//
//  Created by 김혜빈 on 2021/01/28.
//

import UIKit

extension UIButton {
    func setTabButtonType(title: String, color: UIColor) {
        setTitle(title, for: .normal)
        titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        setTitleColor(color, for: .normal)
        setRadiusStroke(color: color)
    }
    
    func setupEnable(color: UIColor) {
        isEnabled = true
        setTitleColor(color, for: .normal)
        layer.borderColor = color.cgColor
    }
    
    func setupUnable() {
        isEnabled = false
        setTitleColor(UIColor(named: "unable_text"), for: .normal)
        layer.borderColor = UIColor(named: "unable_stroke")?.cgColor
    }
    
    func setRadiusStroke(width: CGFloat = 1, color: UIColor, radius: CGFloat = 12, insets: CGFloat = 12) {
        layer.borderWidth = width
        layer.borderColor = color.cgColor
        layer.cornerRadius = radius
        contentEdgeInsets = UIEdgeInsets(top: insets, left: insets, bottom: insets, right: insets)
    }
}
