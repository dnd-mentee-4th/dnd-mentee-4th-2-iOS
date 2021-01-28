//
//  TabButtonCollectionCell.swift
//  EchoNote
//
//  Created by 김혜빈 on 2021/01/28.
//

import UIKit
import Then

struct TabItem {
    var isSelected: Bool = false
    var title: String
    var color: UIColor
}

class TabButtonCollectionCell: UICollectionViewCell {
    static let identifier = "TabButtonCollectionCell"
    let titleLabel = UILabel()
        .then {
            $0.text = "😃 Tab"
            $0.textColor = .systemBlue
            $0.font = UIFont.boldSystemFont(ofSize: 14)
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
        self.layer.cornerRadius = 12
        self.layer.borderWidth = 1
        self.layer.borderColor = UIColor.systemBlue.cgColor
        
        setupTitleLabel()
    }
    
    func setButtonInformatin(item: TabItem) {
        titleLabel.text = item.title
        if item.isSelected {
            titleLabel.textColor = item.color
            self.layer.borderColor = item.color.cgColor
        } else {
            titleLabel.textColor = UIColor(displayP3Red: 215/255, green: 215/255, blue: 215/255, alpha: 1)
            self.layer.borderColor = UIColor(displayP3Red: 215/255, green: 215/255, blue: 215/255, alpha: 1).cgColor
        }
    }
}

// MARK: +UI
extension TabButtonCollectionCell {
    func setupTitleLabel() {
        self.addSubview(titleLabel)

        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 12).isActive = true
        titleLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -12).isActive = true
        titleLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 12).isActive = true
        titleLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -12).isActive = true
    }
}
