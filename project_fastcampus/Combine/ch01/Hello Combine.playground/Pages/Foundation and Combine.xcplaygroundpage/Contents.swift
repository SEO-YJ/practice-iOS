//: [Previous](@previous)

import Foundation
import Combine
import UIKit

/*
 Publisher
 - iOS 에서는 자동으로 제공해주는 Publisher 녀석들이 있음
     - NotificationCenter
     - Timer
     - URLSession.dataTask
 */


//MARK: URLSessionTask Publisher and JSON Decoding Operator
/*
 URLSessionTask
 : 서버에서 어떤 데이터를 받을 때, URLSession을 통해 서버로부터 데이터를 받아옴.
 
 */
struct SomeDecodable: Decodable {  }

URLSession.shared.dataTaskPublisher(for: URL(string: "https://www.google.com")!)
    .map { data, response in
    return data
    }
    .decode(type: SomeDecodable.self, decoder: JSONDecoder())
/*
 코드 설명
 1. URLSession.dataTaskPublisher를 이용
 2. 특정 URL에 데이터 request
 3. 서버에서 받은 데이터를 decoding
 4. decoding은 서버로부터 받은 데이터를 현재 앱 내에서 사용하는 객체로 변환
 5.
 */

//MARK: Notifications
/*
 Notification
 : 데이터를 전송할 때, Noti에 실어서 데이터를 보낸다.
 */

let center = NotificationCenter.default // Notification 생성
let noti = Notification.Name("MyNoti") // noti 생성
let notiPublisher = center.publisher(for: noti, object: nil)
let subscription1 = notiPublisher.sink { _ in
    print("Received noti")
}

center.post(name: noti, object: nil) // 실제로 noti 보내기
center.post(name: noti, object: nil) // 실제로 noti 보내기
subscription1.cancel()

/*
 코드설명
 1. Publisher가 이러한 noti에 대해서 데이터를 제공하겠다.
 2. Notification Center는 이러한 noti를 계속 쏘는 것 이다.
 3. subscription1은 notiPublisher에 대한 Subscriber로써
 notiPublisher가 noti를 쏘면, print문을 실행한다.
 */



//MARK: KeyPath binding to NSObject instances
/*
 KeyPath: assign의 KeyPath 이용
 NSObject: UIKit의 클래스 이용
 */
 
let ageLabel = UILabel()
print("Text: \(ageLabel.text)")
Just(28)
    .map {"Age is \($0)"}
    .assign(to: \.text, on: ageLabel)
print("Text: \(ageLabel.text!)")

//MARK: Timer
// autoconnect 를 이용하면 subscribe 되면 바로 시작함
/*
 Timer
 : 어떤 Subscriber가 Timer Publisher를 구독했을 때 Timer가 동작하게끔하라.
  
 */
let timerPublisher = Timer
    .publish(every: 1 , on: .main, in: .common) // 1초마다, main 스레드에서, 보통방법으로
    .autoconnect() // 자동으로 연결하라

let subscription2 = timerPublisher.sink { time in
    print("Time: \(time)")
}

// TimerPublisher 취소 방법
DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
    subscription2.cancel()
}



//: [Next](@next)
