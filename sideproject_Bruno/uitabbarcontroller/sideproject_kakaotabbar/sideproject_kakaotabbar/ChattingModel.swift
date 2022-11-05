//
//  ChattingModel.swift
//  sideproject_kakaotabbar
//
//  Created by 서유준 on 2022/11/04.
//

import Foundation

struct ChattingModel {
    let icon: String
    let name: String
    let chat: String
    let alarm: String?
    let date: String
    let chatCount: Int?
}

extension ChattingModel {
    static let list: [ChattingModel] = [
        ChattingModel(icon: "person", name: "김유준", chat: "xcode로 카카오톡 채팅방 리스트를 만들어 봤어.", alarm: "bell.slash.fill", date: "오후 9:20", chatCount: 5),
        ChattingModel(icon: "person.fill", name: "Bruno Seo", chat: "Hello~ Welcome to Swift world!", alarm: nil, date: "오후 8:30", chatCount: nil),
        ChattingModel(icon: "person.3.fill", name: "스위프트개발자", chat: "API 관련 질문있습니다!", alarm: "bell.slash.fill", date: "오후 5:27", chatCount: 123),
        ChattingModel(icon: "person.3", name: "SwiftUI & Combine + RxSwift", chat: "질문있습니다. Extension과 Protocol의 차이는 무엇인가요.. 이해가 되지 않습니다 ㅜㅜ", alarm: "bell.slash.fill", date: "오후 4:51", chatCount: 30),
        ChattingModel(icon: "message.circle.fill", name: "카카오페이", chat: "송금이 완료되었습니다. ", alarm: nil, date: "오후 1:20", chatCount: 412),
        ChattingModel(icon: "person.crop.circle.badge.questionmark.fill", name: "손흥민", chat: "이번 월드컵 기대해주세요!!~~!~!", alarm: nil, date: "오전 11:37", chatCount: nil),
        ChattingModel(icon: "person.circle", name: "Messi", chat: "Hello, Bruno! How are you? I'm working at PSG. I would like to invite you our stadium. I'm wating for you. see ya~", alarm: "bell.slash.fill", date: "오전 9:51", chatCount: 3),
        ChattingModel(icon: "person.2", name: "서울한국대학교 조별과제 모임", chat: "저희 이번 프로젝트는 Swiftf를 이용한 알람앱을 만들어보려고 합니다. 다들 준비는 잘 되가시는 가요...?", alarm: "bell.slash.fill", date: "어제", chatCount: 232),
        ChattingModel(icon: "person.2.fill", name: "고등학교 친구들", chat: "뭐함?", alarm: "bell.slash.fill", date: "10월 24일", chatCount: nil),
        ChattingModel(icon: "person.crop.circle", name: "Plab", chat: "User's Voice Bruno님, 오늘 플랩 어땟나요~~ 즐겁게 차셨나요~~", alarm: nil, date: "10월 24일", chatCount: nil),
        ChattingModel(icon: "person.circle", name: "박유준", chat: "과제 어떻게 하고 있어? 과제 어떻게 하고 있어?  과제 어떻게 하고 있어?  과제 어떻게 하고 있어?  과제 어떻게 하고 있어? ", alarm: "bell.slash.fill", date: "10월 23일", chatCount: 1000),
        ChattingModel(icon: "person.fill", name: "이유준", chat: "안녕하세여 반갑습니다~ 안녕하세여 반갑습니다~ 안녕하세여 반갑습니다~ 안녕하세여 반갑습니다~ 안녕하세여 반갑습니다~", alarm: nil, date: "10월 22일", chatCount: nil)
    ]
}
