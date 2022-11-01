//
//  DataModel.swift
//  sideproject_kakaoseemorelist
//
//  Created by 서유준 on 2022/11/01.
//

import Foundation

struct DataModel {
    let iconImage: String
    let icanName: String
}

extension DataModel {
    static let list: [DataModel] = [
    DataModel(iconImage: "gift", icanName: "선물하기"),
    DataModel(iconImage: "app.gift", icanName: "쇼핑하기"),
    DataModel(iconImage: "pencil.circle", icanName: "메이커스"),
    DataModel(iconImage: "hare", icanName: "프렌즈"),
    DataModel(iconImage: "plus.message", icanName: "이모티콘"),
    DataModel(iconImage: "square.and.arrow.down.on.square", icanName: "톡서랍"),
    DataModel(iconImage: "mail", icanName: "메일"),
    DataModel(iconImage: "calendar", icanName: "캘린더"),
    DataModel(iconImage: "gamecontroller", icanName: "게임"),
    DataModel(iconImage: "chevron.up", icanName: "패션"),
    DataModel(iconImage: "fork.knife", icanName: "주문하기"),
    DataModel(iconImage: "ticket", icanName: "멜론티켓"),
    DataModel(iconImage: "mappin.and.ellipse", icanName: "카카오맵"),
    DataModel(iconImage: "message.circle", icanName: "오픈채팅"),
    DataModel(iconImage: "person.text.rectangle", icanName: "톡명함"),
    DataModel(iconImage: "square.grid.2x2", icanName: "전체서비스"),
    DataModel(iconImage: "gift", icanName: "Gift"),
    DataModel(iconImage: "app.gift", icanName: "Shopping"),
    DataModel(iconImage: "pencil.circle", icanName: "Makers"),
    DataModel(iconImage: "hare", icanName: "Friends"),
    DataModel(iconImage: "plus.message", icanName: "Emoticon"),
    DataModel(iconImage: "square.and.arrow.down.on.square", icanName: "Talk Drawer"),
    DataModel(iconImage: "mail", icanName: "Mail"),
    DataModel(iconImage: "calendar", icanName: "Calendar"),
    DataModel(iconImage: "gamecontroller", icanName: "Game"),
    DataModel(iconImage: "chevron.up", icanName: "Fashion"),
    DataModel(iconImage: "fork.knife", icanName: "Order"),
    DataModel(iconImage: "ticket", icanName: "Melon Ticket"),
    DataModel(iconImage: "mappin.and.ellipse", icanName: "Kakao Map"),
    DataModel(iconImage: "message.circle", icanName: "Open Chattting"),
    DataModel(iconImage: "person.text.rectangle", icanName: "Talk Card"),
    DataModel(iconImage: "square.grid.2x2", icanName: "All Service")
    ]
}
