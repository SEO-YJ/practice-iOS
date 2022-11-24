//
//  Transportation.swift
//  apptool_modal_transportation
//
//  Created by 서유준 on 2022/11/21.
//

import Foundation

struct TransportationModel: Hashable {
    let transportationIcon: String
    let transportationName: String
    let transportationURl: String?
}

extension TransportationModel {
    static let list: [TransportationModel] = [
        TransportationModel(transportationIcon: "airplane", transportationName: "비행기", transportationURl: nil),
    TransportationModel(transportationIcon: "car", transportationName: "자동차", transportationURl: nil),
    TransportationModel(transportationIcon: "bus", transportationName: "버스", transportationURl: nil),
    TransportationModel(transportationIcon: "tram", transportationName: "트램", transportationURl: nil),
    TransportationModel(transportationIcon: "cablecar", transportationName: "케이블카", transportationURl: nil),
    TransportationModel(transportationIcon: "ferry", transportationName: "연락선", transportationURl: nil),
    TransportationModel(transportationIcon: "train.side.front.car", transportationName: "지하철", transportationURl: nil),
    TransportationModel(transportationIcon: "bicycle", transportationName: "자전거", transportationURl: nil),
    TransportationModel(transportationIcon: "scooter", transportationName: "스쿠터", transportationURl: nil),
    ]

    static let urlList: [TransportationModel] = [TransportationModel(transportationIcon: "korail", transportationName: "코레일", transportationURl: "https://www.letskorail.com/?NaPm=ct%3Dlaqgmy2f%7Cci%3Dcheckout%7Ctr%3Dds%7Ctrx%3D%7Chk%3D01ac6e66d754a511ea90e3a7b57854751a208233"), TransportationModel(transportationIcon: "koreanAir", transportationName: "대한항공", transportationURl: "https://www.koreanair.com/kr/ko?NaPm=ct%3Dlaqgntjp%7Cci%3Dcheckout%7Ctr%3Dds%7Ctrx%3D%7Chk%3D9b1740a2b54d89ac052aaa1badabdbada7bbf38e"), TransportationModel(transportationIcon: "asianaAir", transportationName: "아시아나항공", transportationURl: "https://flyasiana.com/C/KR/KO/index"), TransportationModel(transportationIcon: "ferryDotCom", transportationName: "배닷컴", transportationURl: "http://www.vaetour.com/ship/step1.php?country=2&so=1")]
}



/*
 코레일
 https://www.letskorail.com/?NaPm=ct%3Dlaqgmy2f%7Cci%3Dcheckout%7Ctr%3Dds%7Ctrx%3D%7Chk%3D01ac6e66d754a511ea90e3a7b57854751a208233
 대한항공
 https://www.koreanair.com/kr/ko?NaPm=ct%3Dlaqgntjp%7Cci%3Dcheckout%7Ctr%3Dds%7Ctrx%3D%7Chk%3D9b1740a2b54d89ac052aaa1badabdbada7bbf38e
 아시아나항공
 https://flyasiana.com/C/KR/KO/index
 배닷컴
 http://www.vaetour.com/ship/step1.php?country=2&so=1
 */
