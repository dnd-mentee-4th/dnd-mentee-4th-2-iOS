//
//  ViewController.swift
//  EchoNote
//
//  Created by 김혜빈 on 2021/01/16.
//

import UIKit

class HomeViewController: UIViewController {
    var tabButtonCollectionView: UICollectionView!
    let flowLayout = UICollectionViewFlowLayout()
        .then {
            $0.estimatedItemSize = CGSize(width: 100, height: 45)
            $0.scrollDirection = .horizontal
        }
    let percentLabel = UILabel()
        .then {
            $0.numberOfLines = 0
        }
    let remainingLabel = UILabel()
    let circleProgressBar = CircleProgressBar(frame: CGRect(x: 0, y: 0, width: 55, height: 55))
        .then {
            $0.setProgressWithAnimation(duration: 1.0, value: (20 * 60 + 20) / (24 * 60))
            $0.labelText = "Q"
            $0.labelSize = 22
        }
    
    // todo - tabItems는 나중에 API 데이터로 대체하던가 뷰모델에서 처리하던가 해야 합니다.
    var tabItems: [TabItem] = [
        TabItem(isSelected: true, title: "♻️분리수거", color: UIColor(displayP3Red: 2/255, green: 188/255, blue: 121/255, alpha: 1)),
        TabItem(title: "💧물절약", color: UIColor(displayP3Red: 56/255, green: 199/255, blue: 244/255, alpha: 1)),
        TabItem(title: "🌱친환경 제품", color: UIColor(displayP3Red: 142/255, green: 217/255, blue: 20/255, alpha: 1)),
        TabItem(title: "🥡다회용기", color: UIColor(displayP3Red: 249/255, green: 64/255, blue: 97/255, alpha: 1)),
        TabItem(title: "🧾전자 영수증", color: UIColor(displayP3Red: 67/255, green: 65/255, blue: 165/255, alpha: 1))]
    var selectedTabButtonIndex = 0
    var currentTime: Float = 20*60+20 {
        didSet {
            circleProgressBar.setProgressWithAnimation(duration: 1.0, value: currentTime / (24 * 60))
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setupView()
        bindViewModel()
    }
    
    func setupView() {
        self.view.backgroundColor = .white
        
        setupTabButtonCollectionView()
        setupPercentLabel()
        setupRemainingLabel()
        setupCircleProgressBar()
    }
    
    func bindViewModel() {
        // todo - selectedTabButtonIndex가 바뀔때마다 percentLabel, remainingLabel에 적용되는 데이터가 달라집니다.
    }
}
