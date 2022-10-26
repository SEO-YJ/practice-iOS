//
//  TransportationModel.swift
//  apptool_uicollectionview_transportation
//
//  Created by 서유준 on 2022/10/26.
//

import Foundation

struct TransportationModel {
    let transportationIcon: String
    let transportationName: String
    let transportationPrice: Int
}

extension TransportationModel {
    static let list: [TransportationModel] = [
    TransportationModel(transportationIcon: "airplane", transportationName: "비행기", transportationPrice: 200000),
    TransportationModel(transportationIcon: "car", transportationName: "자동차", transportationPrice: 50000),
    TransportationModel(transportationIcon: "bus", transportationName: "버스", transportationPrice: 1200),
    TransportationModel(transportationIcon: "tram", transportationName: "트램", transportationPrice: 15000),
    TransportationModel(transportationIcon: "cablecar", transportationName: "케이블카", transportationPrice: 20000),
    TransportationModel(transportationIcon: "ferry", transportationName: "연락선", transportationPrice: 80000),
    TransportationModel(transportationIcon: "train.side.front.car", transportationName: "지하철", transportationPrice: 2000),
    TransportationModel(transportationIcon: "bicycle", transportationName: "자전거", transportationPrice: 1000),
    TransportationModel(transportationIcon: "scooter", transportationName: "스쿠터", transportationPrice: 60000)
    ]
}
