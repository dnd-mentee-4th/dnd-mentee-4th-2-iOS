//
//  TabButtonCollectionCell.swift
//  EchoNote
//
//  Created by 김혜빈 on 2021/01/28.
//

import UIKit
import Then

class TabButtonCollectionCell: UICollectionViewCell {
    static let identifier = "TabButtonCollectionCell"
    private let titleLabel = UILabel()
        .then {
            $0.text = "Tab"
            $0.textColor = .systemBlue
            $0.font = UIFont.boldSystemFont(ofSize: 14)
        }
    private let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 19, height: 19))
        .then {
            $0.autoresizesSubviews = true
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
        self.backgroundColor = .white
        self.layer.cornerRadius = 20
        self.layer.borderWidth = 1
        self.layer.borderColor = UIColor.systemBlue.cgColor
        
        setupTitleLabel()
        setupImageView()
    }
    
    func setButtonInformatin(item: MissionTab) {
        imageView.image = UIImage(named: item.image)
        if item.isSelected {
            titleLabel.attributedText = getAttributedText(text: item.title, color: UIColor(named: item.tabTextColor)!)
            self.layer.borderColor = UIColor(named: (item.strokeColor ?? item.tabTextColor))!.cgColor
        } else {
            titleLabel.attributedText = getAttributedText(text: item.title, color: UIColor(named: "grey01")!)
            self.layer.borderColor = UIColor.white.cgColor
        }
    }
}

// MARK: +UI
extension TabButtonCollectionCell {
    private func setupTitleLabel() {
        self.addSubview(titleLabel)

        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 12).isActive = true
        titleLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -12).isActive = true
        titleLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 33).isActive = true
        titleLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -12).isActive = true
    }
    
    private func getAttributedText(text: String, color: UIColor) -> NSAttributedString {
        let attributedString = NSMutableAttributedString(string: text, attributes: [
            .font: UIFont.spoqaMedium(14),
            .foregroundColor: color,
            .kern: -0.14
        ])
        
        return attributedString
    }
    
    private func setupImageView() {
        self.addSubview(imageView)
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.widthAnchor.constraint(equalToConstant: 19).isActive = true
        imageView.heightAnchor.constraint(equalToConstant: 19).isActive = true
        imageView.centerYAnchor.constraint(equalTo: titleLabel.centerYAnchor).isActive = true
        imageView.trailingAnchor.constraint(equalTo: titleLabel.leadingAnchor, constant: -2).isActive = true
    }
}
