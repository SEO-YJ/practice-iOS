//
//  TransportationModel.swift
//  apptool_uicollectionview_transportation
//
//  Created by 서유준 on 2022/10/26.
//

import Foundation

struct TransportationModel: Hashable {
    let transportationIcon: String
    let transportationName: String
}

extension TransportationModel {
    static let list: [TransportationModel] = [
    TransportationModel(transportationIcon: "airplane", transportationName: "비행기"),
    TransportationModel(transportationIcon: "car", transportationName: "자동차"),
    TransportationModel(transportationIcon: "bus", transportationName: "버스"),
    TransportationModel(transportationIcon: "tram", transportationName: "트램"),
    TransportationModel(transportationIcon: "cablecar", transportationName: "케이블카"),
    TransportationModel(transportationIcon: "ferry", transportationName: "연락선"),
    TransportationModel(transportationIcon: "train.side.front.car", transportationName: "지하철"),
    TransportationModel(transportationIcon: "bicycle", transportationName: "자전거"),
    TransportationModel(transportationIcon: "scooter", transportationName: "스쿠터"),
    TransportationModel(transportationIcon: "airplane", transportationName: "Airplane"),
    TransportationModel(transportationIcon: "car", transportationName: "Car"),
    TransportationModel(transportationIcon: "bus", transportationName: "Bus"),
    TransportationModel(transportationIcon: "tram", transportationName: "Tram"),
    TransportationModel(transportationIcon: "cablecar", transportationName: "Cablecar"),
    TransportationModel(transportationIcon: "ferry", transportationName: "Ferry"),
    TransportationModel(transportationIcon: "train.side.front.car", transportationName: "Train"),
    TransportationModel(transportationIcon: "bicycle", transportationName: "Bicycle"),
    TransportationModel(transportationIcon: "scooter", transportationName: "Scooter")
    ]
}
