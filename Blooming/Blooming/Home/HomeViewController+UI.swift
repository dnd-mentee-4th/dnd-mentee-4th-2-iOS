//
//  HomeViewController+UI.swift
//  EchoNote
//
//  Created by 김혜빈 on 2021/01/29.
//

import UIKit

extension HomeViewController {
    // MARK: Mypage Button
    func setupMypageButton() {
        mypageButton.setBackgroundImage(UIImage(named: "ic_btn_my"), for: .normal)
        mypageButton.contentMode = .scaleAspectFit
        self.view.addSubview(mypageButton)
        
        mypageButton.translatesAutoresizingMaskIntoConstraints = false
        mypageButton.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor).isActive = true
        mypageButton.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -10).isActive = true
    }
    
    // MARK: Tab Button Collection View
    func setupTabButtonCollectionView() {
        setupTabButtonCollectionViewSetting()
        self.view.addSubview(tabButtonCollectionView)
        
        tabButtonCollectionView.translatesAutoresizingMaskIntoConstraints = false
        tabButtonCollectionView.heightAnchor.constraint(equalToConstant: 45).isActive = true
        tabButtonCollectionView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 64).isActive = true
        tabButtonCollectionView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor).isActive = true
        tabButtonCollectionView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor).isActive = true
    }
    
    func setupTabButtonCollectionViewSetting() {
        flowLayout.estimatedItemSize = CGSize(width: 100, height: 45)
        flowLayout.scrollDirection = .horizontal
        tabButtonCollectionView = UICollectionView(frame: self.view.frame, collectionViewLayout: flowLayout)
            .then {
                $0.register(TabButtonCollectionCell.self, forCellWithReuseIdentifier: TabButtonCollectionCell.identifier)
                $0.backgroundColor = .clear
                $0.contentInset.left = 32
                $0.contentInset.right = 20
                $0.showsHorizontalScrollIndicator = false
                $0.decelerationRate = .fast
            }
        tabButtonCollectionView.delegate = self
        tabButtonCollectionView.dataSource = self
    }
    
    // MARK: Container View
    func setupContainerView() {
        self.view.addSubview(containerView)
        
        containerView.translatesAutoresizingMaskIntoConstraints = false
        containerView.topAnchor.constraint(equalTo: tabButtonCollectionView.bottomAnchor).isActive = true
        containerView.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        containerView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor).isActive = true
        containerView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor).isActive = true
    }
    
    // MARK: Logout Home
    func setupLogoutHome() {
        logoutHome.delegate = self
        flowerHome.removeFromSuperview()
        containerView.addSubview(logoutHome)
        
        logoutHome.translatesAutoresizingMaskIntoConstraints = false
        logoutHome.topAnchor.constraint(equalTo: containerView.topAnchor).isActive = true
        logoutHome.bottomAnchor.constraint(equalTo: containerView.bottomAnchor).isActive = true
        logoutHome.leadingAnchor.constraint(equalTo: containerView.leadingAnchor).isActive = true
        logoutHome.trailingAnchor.constraint(equalTo: containerView.trailingAnchor).isActive = true
    }
    
    // MARK: Flower Home
    func setupFlowerHome() {
        flowerHome.delegate = self
        logoutHome.removeFromSuperview()
        containerView.addSubview(flowerHome)
        
        flowerHome.translatesAutoresizingMaskIntoConstraints = false
        flowerHome.topAnchor.constraint(equalTo: containerView.topAnchor).isActive = true
        flowerHome.bottomAnchor.constraint(equalTo: containerView.bottomAnchor).isActive = true
        flowerHome.leadingAnchor.constraint(equalTo: containerView.leadingAnchor).isActive = true
        flowerHome.trailingAnchor.constraint(equalTo: containerView.trailingAnchor).isActive = true
    }
    
    // MARK: Quiz Button (추가구현)
//    func setupQuizButton() {
//        quizButton.currentTime = getCurrentTime()
//        quizButton.layer.shadowOpacity = 0.1
//        quizButton.layer.shadowOffset = CGSize(width: 0, height: 5)
//        quizButton.layer.shadowRadius = 10
//        quizButton.layer.shadowColor = UIColor.black.cgColor
//        quizButton.isHidden = true // todo - 로그인 여부에 따라, 퀴즈 풀이 여부에 따라 달라져야 합니다.
//        self.view.addSubview(quizButton)
//
//        quizButton.translatesAutoresizingMaskIntoConstraints = false
//        quizButton.widthAnchor.constraint(equalToConstant: 56).isActive = true
//        quizButton.heightAnchor.constraint(equalToConstant: 56).isActive = true
//        quizButton.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -20).isActive = true
//        quizButton.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: -50).isActive = true
//    }
    
//    func getCurrentTime() -> Float {
//        let date = Date()
//        let calendar = Calendar.current
//        let components = calendar.dateComponents([.hour, .minute, .second], from: date)
//        return Float((components.hour ?? 0) * 60 + (components.minute ?? 0))
//    }
}
