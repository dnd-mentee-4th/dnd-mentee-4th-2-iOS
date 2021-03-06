//
//  HomeViewController+Delegate.swift
//  EchoNote
//
//  Created by 김혜빈 on 2021/01/29.
//

import UIKit

extension HomeViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return missionTabItems.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell: TabButtonCollectionCell = collectionView.dequeueReusableCell(withReuseIdentifier: TabButtonCollectionCell.identifier, for: indexPath) as? TabButtonCollectionCell else {
            return TabButtonCollectionCell()
        }
        
        cell.setButtonInformatin(item: missionTabItems[indexPath.item])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
        if indexPath.item == self.selectedTabButtonIndex { return true }
        
        missionTabItems[self.selectedTabButtonIndex].isSelected = false
        missionTabItems[indexPath.item].isSelected = true
        
        self.selectedTabButtonIndex = indexPath.item
        // todo - 선택된 아이템에 따른 처리
        self.tabButtonCollectionView.scrollToItem(at: IndexPath(row: indexPath.item, section: 0), at: .centeredHorizontally, animated: true)
        self.tabButtonCollectionView.reloadData()
        
        return true
    }
}

extension HomeViewController: LogoutHomeProtocol {
    func clickLoginButton() {
        let nextVC = UINavigationController(rootViewController: CommonViewController())
        nextVC.isNavigationBarHidden = true
        nextVC.modalPresentationStyle = .fullScreen
        self.show(nextVC, sender: self)
    }
}

extension HomeViewController: FlowerHomeDelegate {
    func clickActivityButton() {
        // todo - 카메라 화면 띄우기
    }
}
