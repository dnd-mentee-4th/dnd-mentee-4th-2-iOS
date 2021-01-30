//
//  HomeViewController+UI.swift
//  EchoNote
//
//  Created by 김혜빈 on 2021/01/29.
//

import UIKit

extension HomeViewController {
    // MARK: Tab Button Collection View
    func setupTabButtonCollectionView() {
        tabButtonCollectionView = UICollectionView(frame: self.view.frame, collectionViewLayout: flowLayout)
            .then {
                $0.register(TabButtonCollectionCell.self, forCellWithReuseIdentifier: TabButtonCollectionCell.identifier)
                $0.backgroundColor = UIColor.white
                $0.contentInset.left = 32
                $0.contentInset.right = 20
                $0.showsHorizontalScrollIndicator = false
                $0.decelerationRate = .fast
            }
        tabButtonCollectionView.delegate = self
        tabButtonCollectionView.dataSource = self
        self.view.addSubview(tabButtonCollectionView)
        
        tabButtonCollectionView.translatesAutoresizingMaskIntoConstraints = false
        tabButtonCollectionView.heightAnchor.constraint(equalToConstant: 45).isActive = true
        tabButtonCollectionView.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 116).isActive = true
        tabButtonCollectionView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor).isActive = true
        tabButtonCollectionView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor).isActive = true
    }
    
    // MARK: Percent Label
    func setupPercentLabel() {
        setupEmptyFlowerPercentLabel(title: "분리수거", accentColor: UIColor(red: 2.0 / 255.0, green: 188.0 / 255.0, blue: 121.0 / 255.0, alpha: 1.0))
        self.view.addSubview(percentLabel)
        
        percentLabel.translatesAutoresizingMaskIntoConstraints = false
        percentLabel.topAnchor.constraint(equalTo: tabButtonCollectionView.bottomAnchor, constant: 35).isActive = true
        percentLabel.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 32).isActive = true
    }
    
    func setupEmptyFlowerPercentLabel(title: String, accentColor: UIColor) {
        let attributedString = NSMutableAttributedString(string: "꽃밭에 \(title)\n꽃이 아직 없어요", attributes: [
            .font: UIFont.boldSystemFont(ofSize: 28),
          .kern: -0.28
        ])
        attributedString.addAttribute(.foregroundColor, value: accentColor, range: NSRange(location: 8 + title.count, length: 6))
        
        percentLabel.attributedText = attributedString
    }
    
    func setupNotEmptyFlowerPercentLabel(title: String, percent: String, accentColor: UIColor) {
        let attributedString = NSMutableAttributedString(string: "\(title) 꽃이\n\(percent)% 피었어요", attributes: [
            .font: UIFont.boldSystemFont(ofSize: 28),
          .kern: -0.28
        ])
        attributedString.addAttributes([
            .font: UIFont.boldSystemFont(ofSize: 28),
          .foregroundColor: accentColor
        ], range: NSRange(location: 4 + title.count, length: percent.count))
        attributedString.addAttributes([
            .font: UIFont.boldSystemFont(ofSize: 28),
          .foregroundColor: accentColor
        ], range: NSRange(location: 4 + title.count + percent.count, length: 1))
        
        percentLabel.attributedText = attributedString
    }
    
    // MARK: Remaining Label
    func setupRemainingLabel() {
        setupEmptyFlowerRemainingLabel()
        self.view.addSubview(remainingLabel)
        
        remainingLabel.translatesAutoresizingMaskIntoConstraints = false
        remainingLabel.topAnchor.constraint(equalTo: percentLabel.bottomAnchor, constant: 8).isActive = true
        remainingLabel.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 32).isActive = true
    }
    
    func setupEmptyFlowerRemainingLabel() {
        let attributedString = NSMutableAttributedString(string: "꽃을 새롭게 키워보세요", attributes: [
            .font: UIFont.systemFont(ofSize: 16),
          .foregroundColor: UIColor(white: 137.0 / 255.0, alpha: 1.0),
          .kern: -0.16
        ])
        attributedString.addAttribute(.font, value: UIFont.boldSystemFont(ofSize: 16), range: NSRange(location: 3, length: 3))
        
        remainingLabel.attributedText = attributedString
    }
    
    func setupNotEmptyFlowerRemainingLabel(count: Int, accentColor: UIColor) {
        let attributedString = NSMutableAttributedString(string: "꽃 수확을 위해 \(count)번 더 실천하세요", attributes: [
            .font: UIFont.boldSystemFont(ofSize: 16),
          .foregroundColor: UIColor(white: 137.0 / 255.0, alpha: 1.0),
          .kern: -0.16
        ])
        attributedString.addAttributes([
            .font: UIFont.boldSystemFont(ofSize: 16),
          .foregroundColor: accentColor
        ], range: NSRange(location: 9, length: 1))
        
        remainingLabel.attributedText = attributedString
    }
    
    // MARK: Circle Progress Bar
    func setupCircleProgressBar() {
        self.view.addSubview(circleProgressBar)
        
        circleProgressBar.translatesAutoresizingMaskIntoConstraints = false
        circleProgressBar.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -20 - 55).isActive = true
        circleProgressBar.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: -51 - 55).isActive = true
    }
}
