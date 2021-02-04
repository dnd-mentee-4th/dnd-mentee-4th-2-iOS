//
//  ViewController.swift
//  EchoNote
//
//  Created by 김혜빈 on 2021/01/16.
//

import UIKit

class HomeViewController: UIViewController {
    let mypageButton = UIButton(frame: CGRect(x: 0, y: 0, width: 45, height: 45))
        .then {
            $0.setBackgroundImage(UIImage(named: "ic_btn_my"), for: .normal)
            $0.contentMode = .scaleAspectFit
        }
    var tabButtonCollectionView: UICollectionView!
    let flowLayout = UICollectionViewFlowLayout()
        .then {
            $0.estimatedItemSize = CGSize(width: 100, height: 45)
            $0.scrollDirection = .horizontal
        }
    let quizButton = QuizButton()
        .then {
            $0.layer.shadowOpacity = 0.1
            $0.layer.shadowOffset = CGSize(width: 0, height: 5)
            $0.layer.shadowRadius = 10
            $0.layer.shadowColor = UIColor.black.cgColor
        }
    
    // todo - tabItems는 나중에 API 데이터로 대체하던가 뷰모델에서 처리하던가 해야 합니다.
    var tabItems: [TabItem] = [
        TabItem(isSelected: true, title: "분리수거", textColor: "mediumGreen", image: "ic_btn_my", strokeColor: "lightGreen"),
        TabItem(isSelected: false, title: "물절약", textColor: "greyBlue", image: "ic_btn_my", strokeColor: "skyBlue"),
        TabItem(isSelected: false, title: "친환경 제품", textColor: "macaroniAndCheese", image: "ic_btn_my"),
        TabItem(isSelected: false, title: "다회용기", textColor: "palePurple", image: "ic_btn_my"),
        TabItem(isSelected: false, title: "전자 영수증", textColor: "salmon", image: "ic_btn_my", strokeColor: "lightPeach")
    ]
    var selectedTabButtonIndex = 0

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
        setupQuizButton()
    }
    
    func bindViewModel() {
        // todo - selectedTabButtonIndex가 바뀔때마다 percentLabel, remainingLabel에 적용되는 데이터가 달라집니다.
    }
    
    func getCurrentTime() -> Float {
        let date = Date()
        let calendar = Calendar.current
        let components = calendar.dateComponents([.hour, .minute, .second], from: date)
        return Float((components.hour ?? 0) * 60 + (components.minute ?? 0))
    }
}
