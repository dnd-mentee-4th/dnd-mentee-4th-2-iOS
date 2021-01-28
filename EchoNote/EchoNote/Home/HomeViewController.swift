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
    
    var tabItems: [TabItem] = []
    var selectedTabButtonIndex = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setupView()
    }
    
    func setupView() {
        self.view.backgroundColor = .white
        
        setupTabButtonCollectionView()
        setupPercentLabel()
    }
}
