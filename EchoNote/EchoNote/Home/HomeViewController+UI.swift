//
//  HomeViewController+UI.swift
//  EchoNote
//
//  Created by 김혜빈 on 2021/01/29.
//

import UIKit

extension HomeViewController {
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
}
