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
    
    var tabItems: [TabItem] = [
        TabItem(isSelected: true, title: "♻️분리수거", color: UIColor(displayP3Red: 2/255, green: 188/255, blue: 121/255, alpha: 1)),
        TabItem(title: "💧물절약", color: UIColor(displayP3Red: 56/255, green: 199/255, blue: 244/255, alpha: 1)),
        TabItem(title: "🌱친환경 제품", color: UIColor(displayP3Red: 142/255, green: 217/255, blue: 20/255, alpha: 1)),
        TabItem(title: "🥡다회용기", color: UIColor(displayP3Red: 249/255, green: 64/255, blue: 97/255, alpha: 1)),
        TabItem(title: "🧾전자 영수증", color: UIColor(displayP3Red: 67/255, green: 65/255, blue: 165/255, alpha: 1))]
    var selectedTabButtonIndex = 0

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
    }
    
    func bindViewModel() {
        // todo - selectedTabButtonIndex가 바뀔때마다 percentLabel, remainingLabel에 적용되는 데이터가 달라집니다.
    }
}
