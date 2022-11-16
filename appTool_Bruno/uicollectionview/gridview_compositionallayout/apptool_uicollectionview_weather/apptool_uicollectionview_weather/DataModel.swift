//
//  DataModel.swift
//  apptool_uicollectionview
//
//  Created by 서유준 on 2022/10/23.
//

import Foundation
/*
 Presentation: 셀을 어떻게 표현할거야?
 
 위 파일은 UICollectionView에서 사용할 데이터들을 저장한 파일입니다.
 
 위 파일은 Swift 파일로 생성하였습니다.
 Swift vs Cocoa Touch Class
 Swift: Swift 언어를 쓸 수 있는 파일
 Cocoa Touch Class: iOS를 위한 Framework, 주로 Storyboard의 component를 코드파일에서 다루고자 할 때, 사용
 */

struct DataModel: Hashable {
/*
 데이터를 위한 사용자 타입을 구조체로 선언합니다.
 */
    let weatherName: String
    let weatherIcon: String
}

extension DataModel {
    /*
     DataModel 사용자 타입을 확장합니다.
     여기서는
     1. UICollectionView는 여러 개의 셀을 관리하기에 컬렉션 타입을 생성합니다.
     2. 컬렉션 타입의 멤버를 사용자 타입으로 하고, 각 셀들에 들어갈 데이터를 할당합니다.
     3. UIImage를 사용할 경우, Assets에 그림파일을 저장해놓고 사용합니다.
     (위 프로젝트는 SF symbols에 있는 그림파일을 사용하였습니다.)
     */
    static let list: [DataModel] = [
    DataModel(weatherName: "맑음", weatherIcon: "sun.min"),
    DataModel(weatherName: "더움", weatherIcon: "sun.max.fill"),
    DataModel(weatherName: "일출", weatherIcon: "sunrise"),
    DataModel(weatherName: "일몰", weatherIcon: "sunset"),
    DataModel(weatherName: "맑음&먼지", weatherIcon: "sun.dust"),
    DataModel(weatherName: "맑음&바람", weatherIcon: "sun.haze"),
    DataModel(weatherName: "구름", weatherIcon: "cloud"),
    DataModel(weatherName: "바람", weatherIcon: "wind"),
    DataModel(weatherName: "눈", weatherIcon: "snow"),
    ]
}
