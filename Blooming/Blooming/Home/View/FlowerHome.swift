//
//  EmptyFlowerHome.swift
//  Blooming
//
//  Created by 김혜빈 on 2021/02/10.
//

import UIKit

struct Flower {
    var title: String
    var score: Int
    var color: String
    
    var percent: Int {
        return Int(score/4 * 100)
    }
}

protocol FlowerHomeDelegate: class {
    func clickActivityButton()
}

class FlowerHome: UIView {
    let percentageLabel = UILabel()
    let activityButton = UIButton()
    
    weak var delegate: FlowerHomeDelegate?

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
        setupActivityButton()
    }
    
    func setFlowerInfo(flower: Flower) {
        if flower.score == 0 {
            percentageLabel.attributedText = getEmptyPercentageText(color: UIColor(named: flower.color)!)
            return
        }
        percentageLabel.attributedText = getFlowerPercentageText(color: UIColor(named: flower.color)!, title: flower.title, percent: flower.percent)
    }
    
    @objc func clickActivityButton(_ sender: UIButton) {
        delegate?.clickActivityButton()
    }
}

// MARK: +UI
extension FlowerHome {
    // MARK: Percentage Label
    private func setupPercentageLabel() {
        percentageLabel.attributedText = getEmptyPercentageText(color: UIColor.systemGreen)
        self.addSubview(percentageLabel)
        
        percentageLabel.translatesAutoresizingMaskIntoConstraints = false
        percentageLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 35).isActive = true
        percentageLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 32).isActive = true
    }
    
    private func getEmptyPercentageText(color: UIColor) -> NSAttributedString {
        let attributedString = NSMutableAttributedString(string: "꽃밭에 물절약\n꽃이 아직 없어요", attributes: [
            .font: UIFont.spoqaMedium(28),
            .foregroundColor: UIColor(named: "black")!,
            .kern: -0.28
        ])
        attributedString.addAttribute(.foregroundColor, value: color, range: NSRange(location: 11, length: 6))
        
        return attributedString
    }
    
    private func getFlowerPercentageText(color: UIColor, title: String, percent: Int) -> NSAttributedString {
        let attributedString = NSMutableAttributedString(string: "\(title) 꽃이\n\(percent)% 피었어요", attributes: [
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
    
    // MARK: Activity Button
    private func setupActivityButton() {
        activityButton.setImage(UIImage(named: "ic_btn_primary"), for: .normal)
        activityButton.layer.shadowRadius = 10
        activityButton.layer.shadowColor = UIColor(named: "blackTwo")?.cgColor
        activityButton.layer.shadowOffset = CGSize(width: 0, height: 10)
        activityButton.layer.shadowOpacity = 0.7
        activityButton.addTarget(self, action: #selector(clickActivityButton(_:)), for: .touchUpInside)
        self.addSubview(activityButton)
        
        activityButton.translatesAutoresizingMaskIntoConstraints = false
        activityButton.widthAnchor.constraint(equalToConstant: 111).isActive = true
        activityButton.heightAnchor.constraint(equalToConstant: 48).isActive = true
        activityButton.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        activityButton.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -54).isActive = true
    }
}
