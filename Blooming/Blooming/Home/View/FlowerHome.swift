//
//  EmptyFlowerHome.swift
//  Blooming
//
//  Created by 김혜빈 on 2021/02/10.
//

import UIKit

class FlowerHome: UIView {
    let percentageLabel = UILabel()

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        setupView()
    }
    
    func setupView() {
        setupPercentageLabel()
    }
}

// MARK: +UI
extension FlowerHome {
    private func getEmptyPercentageText(color: UIColor) -> NSAttributedString {
        let attributedString = NSMutableAttributedString(string: "꽃밭에 물절약\n꽃이 아직 없어요", attributes: [
            .font: UIFont.spoqaMedium(28),
            .foregroundColor: UIColor(named: "black")!,
            .kern: -0.28
        ])
        attributedString.addAttribute(.foregroundColor, value: color, range: NSRange(location: 11, length: 6))
        
        return attributedString
    }
    
    private func getFlowerPercentageText(color: UIColor, percent: Int) -> NSAttributedString {
        let attributedString = NSMutableAttributedString(string: "재활용 꽃이\n\(percent)% 피었어요", attributes: [
            .font: UIFont.spoqaMedium(28),
            .foregroundColor: UIColor(named: "black")!,
            .kern: -0.28
        ])
        attributedString.addAttributes([
            .font: UIFont.systemFont(ofSize: 28.0, weight: .semibold),
            .foregroundColor: color
        ], range: NSRange(location: 7, length: String(percent).count + 1))
        
        return attributedString
    }
}
