//
//  WeatherModel.swift
//  sideproject_kakaonow
//
//  Created by 서유준 on 2022/11/08.
//

import Foundation

struct WeatherModel {
    let location: String
    let weatherImage: String
    let temperature: String
    let compareTemparature: String
    let fineDustConcentration: String
}

extension WeatherModel {
    static let list: [WeatherModel] = [
    WeatherModel(location: "강북구", weatherImage: "sun.max.fill", temperature: "10°", compareTemparature: "어제보다 1° 높아요", fineDustConcentration: "보통"),
    WeatherModel(location: "도봉구", weatherImage: "sun.max.fill", temperature: "11°", compareTemparature: "어제보다 2° 높아요", fineDustConcentration: "좋음"),
    WeatherModel(location: "노원구", weatherImage: "sunrise", temperature: "12°", compareTemparature: "어제보다 3° 높아요", fineDustConcentration: "좋음"),
    WeatherModel(location: "종로구", weatherImage: "sunset", temperature: "13°", compareTemparature: "어제보다 4° 높아요", fineDustConcentration: "보통"),
    WeatherModel(location: "성북구", weatherImage: "sun.dust", temperature: "14°", compareTemparature: "어제보다 °5 높아요", fineDustConcentration: "나쁨"),
    WeatherModel(location: "강남구", weatherImage: "sun.haze", temperature: "9°", compareTemparature: "어제보다 1° 낮아요", fineDustConcentration: "보통"),
    WeatherModel(location: "서초구", weatherImage: "cloud", temperature: "8°", compareTemparature: "어제보다 2° 낮아요", fineDustConcentration: "나쁨"),
    WeatherModel(location: "송파구", weatherImage: "wind", temperature: "7°", compareTemparature: "어제보다 3° 낮아요", fineDustConcentration: "좋음"),
    WeatherModel(location: "강동구", weatherImage: "snow", temperature: "6°", compareTemparature: "어제보다 4° 낮아요", fineDustConcentration: "나쁨")
    ]
}
