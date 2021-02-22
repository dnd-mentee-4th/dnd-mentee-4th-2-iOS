//
//  MissionTab.swift
//  Blooming
//
//  Created by 김혜빈 on 2021/02/22.
//

import Foundation

struct MissionTab {
    var isSelected: Bool = false
    var title: String
    var tabTextColor: String
    var image: String
    var strokeColor: String?
    var labelColor: String
}

var missionTabItems: [MissionTab] = [
    MissionTab(isSelected: true, title: "분리수거", tabTextColor: "mediumGreen", image: "ic_btn_my", strokeColor: "lightGreen", labelColor: "regularGreen"),
    MissionTab(isSelected: false, title: "물절약", tabTextColor: "greyBlue", image: "ic_btn_my", strokeColor: "skyBlue", labelColor: "greyBlue"),
    MissionTab(isSelected: false, title: "친환경 제품", tabTextColor: "macaroniAndCheese", image: "ic_btn_my", labelColor: "macaroniAndCheese"),
    MissionTab(isSelected: false, title: "다회용기", tabTextColor: "palePurple", image: "ic_btn_my", labelColor: "palePurple"),
    MissionTab(isSelected: false, title: "전자 영수증", tabTextColor: "salmon", image: "ic_btn_my", strokeColor: "lightPeach", labelColor: "salmon")
]
