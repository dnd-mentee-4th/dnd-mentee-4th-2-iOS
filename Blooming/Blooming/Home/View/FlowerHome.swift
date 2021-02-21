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
        return Int(score/5 * 100)
    }
    var remaining: Int {
        return 5 - score
    }
}

protocol FlowerHomeDelegate: class {
    func clickActivityButton()
}

class FlowerHome: UIView {
    let percentageLabel = UILabel()
    let remainingLabel = UILabel()
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
        setupRemainingLabel()
        setupActivityButton()
    }
    
    func setFlowerInfo(flower: Flower) {
        if flower.score == 0 {
            percentageLabel.attributedText = getEmptyPercentageText(color: UIColor(named: flower.color)!)
            remainingLabel.attributedText = getEmptyFlowerRemainingLabel()
            return
        }
        percentageLabel.attributedText = getFlowerPercentageText(color: UIColor(named: flower.color)!, title: flower.title, percent: flower.percent)
        remainingLabel.attributedText = getNotEmptyFlowerRemainingLabel(count: flower.remaining, color: UIColor(named: flower.color)!)
    }
    
    @objc func clickActivityButton(_ sender: UIButton) {
        delegate?.clickActivityButton()
    }
}

// MARK: +UI
extension FlowerHome {
    // MARK: Percentage Label
    private func setupPercentageLabel() {
        percentageLabel.numberOfLines = 0
        percentageLabel.attributedText = getEmptyPercentageText(color: UIColor(named: "regularGreen")!)
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
    
    // MARK: Remaining Label
    func setupRemainingLabel() {
        remainingLabel.attributedText = getEmptyFlowerRemainingLabel()
        self.addSubview(remainingLabel)
        
        remainingLabel.translatesAutoresizingMaskIntoConstraints = false
        remainingLabel.topAnchor.constraint(equalTo: percentageLabel.bottomAnchor, constant: 16).isActive = true
        remainingLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 32).isActive = true
    }
    
    func getEmptyFlowerRemainingLabel() -> NSAttributedString {
        let attributedString = NSMutableAttributedString(string: "꽃을 새롭게 키워보세요", attributes: [
            .font: UIFont.systemFont(ofSize: 16),
          .foregroundColor: UIColor(named: "grey03")!,
          .kern: -0.16
        ])

        return attributedString
    }

    func getNotEmptyFlowerRemainingLabel(count: Int, color: UIColor) -> NSAttributedString {
        let attributedString = NSMutableAttributedString(string: "꽃 수확을 위해 \(count)번 더 실천하세요", attributes: [
            .font: UIFont.boldSystemFont(ofSize: 16),
          .foregroundColor: UIColor(named: "grey03")!,
          .kern: -0.16
        ])
        attributedString.addAttributes([
            .font: UIFont.boldSystemFont(ofSize: 16),
          .foregroundColor: color
        ], range: NSRange(location: 9, length: 1))

        return attributedString
    }
    
    // MARK: Activity Button
    private func setupActivityButton() {
        activityButton.setImage(UIImage(named: "ic_btn_primary"), for: .normal)
        activityButton.layer.shadowRadius = 15
        activityButton.layer.shadowColor = UIColor(named: "blackTwo")?.cgColor
        activityButton.layer.shadowOffset = CGSize(width: 0, height: 10)
        activityButton.layer.shadowOpacity = 0.1
        activityButton.addTarget(self, action: #selector(clickActivityButton(_:)), for: .touchUpInside)
        self.addSubview(activityButton)
        
        activityButton.translatesAutoresizingMaskIntoConstraints = false
        activityButton.widthAnchor.constraint(equalToConstant: 111).isActive = true
        activityButton.heightAnchor.constraint(equalToConstant: 48).isActive = true
        activityButton.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        activityButton.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -54).isActive = true
    }
}
