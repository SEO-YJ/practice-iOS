//: [Previous](@previous)

import Foundation
import Combine


// Basic CombineLatest
/*
 Combine Latest란?
 : 2개의 Publisher를 같이 받는 것
 2개의 Publisher의 최근 데이터 값을 같이 전달한다.
 2개의 Publisher에 모두 이벤트 값이 주입되어야 전달을 시작한다.
 */
let strPublisher = PassthroughSubject<String, Never>()
let numPublisher = PassthroughSubject<Int, Never>()

Publishers.CombineLatest(strPublisher, numPublisher).sink { (str, int) in
    print("Latest Value: \(str), \(int)")
}
//strPublisher.combineLatest(numPublisher).sink { (str, int) in
//    print("Latest Value: \(str), \(int)")
//}

strPublisher.send("하이")
strPublisher.send("굿모닝")
strPublisher.send("Good")
numPublisher.send(1)
strPublisher.send("Morning")
numPublisher.send(2)
numPublisher.send(3)
strPublisher.send("How are you?")
numPublisher.send(4)
strPublisher.send("I'm fine thank you")
numPublisher.send(5)





// Advanced CombineLatest
/*
 로그인에 CombineLatest 적용
 */

let usernamePublisher = PassthroughSubject<String, Never>()
let passwordPublisher = PassthroughSubject<String, Never>()

let validatedCredentialsSubscription = usernamePublisher.combineLatest(passwordPublisher)
    .map { (username, password) -> Bool in
        return !username.isEmpty && !password.isEmpty && password.count > 12
    }
    .sink { value in
        print("Credential Valid?: \(value)")
    }
usernamePublisher.send("yujunSeo")
passwordPublisher.send("hi")
passwordPublisher.send("goodPasswordddddd")


// Merge
/*
 CombineLatest + 2개의 Publisher가 Output 타입이 같은 경우
 */

let publisher1 = [1, 2, 3, 4, 5].publisher
let publisher2 = [300, 400, 500, 600].publisher

Publishers.Merge(publisher1, publisher2).sink { value in
    print("Merge: subscription received value: \(value)")
}
//let mergePublisherSubscription = publisher1.merge(with: publisher2)
//    .sink { value in
//        print("Merge: subscription received value: \(value)")
//    }

//: [Next](@next)
