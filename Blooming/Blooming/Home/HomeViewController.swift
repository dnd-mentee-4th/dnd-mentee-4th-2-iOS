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
    private var currentLoginStatus: Bool?
    let mypageButton = UIButton(frame: CGRect(x: 0, y: 0, width: 45, height: 45))
    var tabButtonCollectionView: UICollectionView!
    let flowLayout = UICollectionViewFlowLayout()
//    let quizButton = QuizButton() // 추가구현
    let containerView = UIView()
    let logoutHome = LogoutHome()
    let flowerHome = FlowerHome()
    lazy var helloMessage = HelloMessage()
    
    let viewModel = HomeViewModel()
    var selectedTabButtonIndex = 0

    // MARK: method
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
        bindViewModel()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        viewModel.requestLoginStatus()
    }
    
    func setupView() {
        self.view.backgroundColor = UIColor(named: "white02")!
        
        setupMypageButton()
        setupTabButtonCollectionView()
        setupContainerView()
    }
    
    func bindViewModel() {
        // todo - selectedTabButtonIndex가 바뀔때마다 percentLabel, remainingLabel에 적용되는 데이터가 달라집니다.
        viewModel.output.loginStatus.subscribe(onNext: { [weak self] value in
            if self?.currentLoginStatus == value { return }
            self?.currentLoginStatus = value
            if value {
                self?.setupFlowerHome()
                self?.startHelloMessage(nick: self?.viewModel.nickname ?? "(알수없음)")
            } else { self?.setupLogoutHome() }
        }).disposed(by: disposeBag)
        
        viewModel.output.flower.subscribe(onNext: { [weak self] flowers in
            guard let self = self else {
                print("HomeViewController - self가 없네요")
                return
            }
            DispatchQueue.main.async {
                self.flowerHome.setFlowerInfo(mission: missionTabItems[self.selectedTabButtonIndex], flower: flowers[self.selectedTabButtonIndex])
            }
        }).disposed(by: disposeBag)
    }
    
}
