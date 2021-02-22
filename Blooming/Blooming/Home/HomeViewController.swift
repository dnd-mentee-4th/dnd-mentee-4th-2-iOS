//
//  ViewController.swift
//  EchoNote
//
//  Created by 김혜빈 on 2021/01/16.
//

import UIKit
import RxSwift

class HomeViewController: UIViewController {
    private let disposeBag = DisposeBag()
    let mypageButton = UIButton(frame: CGRect(x: 0, y: 0, width: 45, height: 45))
    var tabButtonCollectionView: UICollectionView!
    let flowLayout = UICollectionViewFlowLayout()
//    let quizButton = QuizButton() // 추가구현
    let containerView = UIView()
    let logoutHome = LogoutHome()
    let flowerHome = FlowerHome()
    
    // todo - tabItems는 나중에 API 데이터로 대체하던가 뷰모델에서 처리하던가 해야 합니다.
    var tabItems: [TabItem] = [
        TabItem(isSelected: true, title: "분리수거", textColor: "mediumGreen", image: "ic_btn_my", strokeColor: "lightGreen"),
        TabItem(isSelected: false, title: "물절약", textColor: "greyBlue", image: "ic_btn_my", strokeColor: "skyBlue"),
        TabItem(isSelected: false, title: "친환경 제품", textColor: "macaroniAndCheese", image: "ic_btn_my"),
        TabItem(isSelected: false, title: "다회용기", textColor: "palePurple", image: "ic_btn_my"),
        TabItem(isSelected: false, title: "전자 영수증", textColor: "salmon", image: "ic_btn_my", strokeColor: "lightPeach")
    ]
    var selectedTabButtonIndex = 0

    // MARK: method
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setupView()
        bindViewModel()
    }
    
    func setupView() {
        self.view.backgroundColor = UIColor(named: "white02")!
        
        setupMypageButton()
        setupTabButtonCollectionView()
        setupContainerView()
//        setupQuizButton() // 추가구현
        
        setupLogoutHome() // todo - 이후 viewmodel의 로그인 여부 상태에 따라 적용해줘야 합니다.
//        setupFlowerHome()
    }
    
    func bindViewModel() {
        // todo - selectedTabButtonIndex가 바뀔때마다 percentLabel, remainingLabel에 적용되는 데이터가 달라집니다.
    }
    
}
