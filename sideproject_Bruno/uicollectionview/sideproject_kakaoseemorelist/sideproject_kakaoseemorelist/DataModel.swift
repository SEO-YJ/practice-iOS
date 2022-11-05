//
//  DataModel.swift
//  sideproject_kakaoseemorelist
//
//  Created by 서유준 on 2022/11/01.
//

import Foundation

struct DataModel {
    let iconImage: String
    let iconName: String
}

extension DataModel {
    static let list: [DataModel] = [
    DataModel(iconImage: "gift", iconName: "선물하기"),
    DataModel(iconImage: "app.gift", iconName: "쇼핑하기"),
    DataModel(iconImage: "pencil.circle", iconName: "메이커스"),
    DataModel(iconImage: "hare", iconName: "프렌즈"),
    DataModel(iconImage: "plus.message", iconName: "이모티콘"),
    DataModel(iconImage: "square.and.arrow.down.on.square", iconName: "톡서랍"),
    DataModel(iconImage: "mail", iconName: "메일"),
    DataModel(iconImage: "calendar", iconName: "캘린더"),
    DataModel(iconImage: "gamecontroller", iconName: "게임"),
    DataModel(iconImage: "chevron.up", iconName: "패션"),
    DataModel(iconImage: "fork.knife", iconName: "주문하기"),
    DataModel(iconImage: "ticket", iconName: "멜론티켓"),
    DataModel(iconImage: "mappin.and.ellipse", iconName: "카카오맵"),
    DataModel(iconImage: "message.circle", iconName: "오픈채팅"),
    DataModel(iconImage: "person.text.rectangle", iconName: "톡명함"),
    DataModel(iconImage: "square.grid.2x2", iconName: "전체서비스"),
    DataModel(iconImage: "gift", iconName: "Gift"),
    DataModel(iconImage: "app.gift", iconName: "Shopping"),
    DataModel(iconImage: "pencil.circle", iconName: "Makers"),
    DataModel(iconImage: "hare", iconName: "Friends"),
    DataModel(iconImage: "plus.message", iconName: "Emoticon"),
    DataModel(iconImage: "square.and.arrow.down.on.square", iconName: "Talk Drawer"),
    DataModel(iconImage: "mail", iconName: "Mail"),
    DataModel(iconImage: "calendar", iconName: "Calendar"),
    DataModel(iconImage: "gamecontroller", iconName: "Game"),
    DataModel(iconImage: "chevron.up", iconName: "Fashion"),
    DataModel(iconImage: "fork.knife", iconName: "Order"),
    DataModel(iconImage: "ticket", iconName: "Melon Ticket"),
    DataModel(iconImage: "mappin.and.ellipse", iconName: "Kakao Map"),
    DataModel(iconImage: "message.circle", iconName: "Open Chattting"),
    DataModel(iconImage: "person.text.rectangle", iconName: "Talk Card"),
    DataModel(iconImage: "square.grid.2x2", iconName: "All Service")
    ]
}
