//
//  WeatherCollectionViewCell.swift
//  apptool_uicollectionview
//
//  Created by 서유준 on 2022/10/23.
//

import UIKit
/*
 Presentation: 어떤 데이터를 사용?
 
 위 파일은 UICollectionView에서 사용할 데이터들을 저장한 파일입니다.
 
 위 파일은 Swift 파일로 생성하였습니다.
 Swift vs Cocoa Touch Class
 Swift: Swift 언어를 쓸 수 있는 파일
 Cocoa Touch Class: iOS를 위한 Framework, 주로 Storyboard의 component를 코드파일에서 다루고자 할 때, 사용
 */

class WeatherCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var weatherNameLabel: UILabel!
    @IBOutlet weak var weatherIconImageView: UIImageView!
    // uicomponent 에 데이터를 업데이트 하는 코드를 넣자
    func configure(_ weather: DataModel) {
        weatherNameLabel.text = weather.weatherName
        weatherIconImageView.image = UIImage(systemName: weather.weatherIcon)
    }
}
