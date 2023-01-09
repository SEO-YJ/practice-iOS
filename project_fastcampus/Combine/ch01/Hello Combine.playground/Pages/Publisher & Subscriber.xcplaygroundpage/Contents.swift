//: [Previous](@previous)

import Foundation
import Combine

// Publisher & Subscriber
// 여러가지 빌트인 Publisher
 
//MARK: Just Publisher
let just = Just([1: "hi", 2: "hello"]) // Publisher
// Just Publisher 특징
// 1. 데이터를 한 번 전송하면 끝
// 2. 배열, 딕셔너리를 전송해도 인자들이 하나씩 전송되는 것이 아니라 통채로 전송된다.

// 1. 후행 클로저
// 2. 반환 타입 생략
// 3. 단축 인자 이름 가능
let subscription1 = just.sink { value in
    print("Received value: \(value)")
}
print(subscription1)
// sink Subscriber 특징
// Publisher가 제공한 데이터를 받을 수 있는 클로저를 제공한다.



//MARK: .publisher Publisher
// .publisher 이용
// Collection 값을 요소 하나씩 Subscriber에게 전달.
// 다 값을 전달하면, 구독 해제

let arrayPublisher = [1, 2, 3, 4, 5 ].publisher
let subscription2 = arrayPublisher.sink { value in
    print("Received value: \(value)")
}
print(subscription2)



//MARK: assign Subscriber
class MyClass {
    var property: Int = 0 {
        willSet {
            print("Will set property to: \(property)")
        }
        didSet {
            print("Did set property to: \(property)")
        }
    }
}
 
// MyClass 객체 생성
let object = MyClass()

// assign Subscriber
// 이 객체의 어느 프로퍼티에 값을 할당할 거냐
let subscription3 = arrayPublisher.assign(to: \.property, on: object)
print(subscription3)
print(object.property)
// object.property = 3

// assign Subscriber 특징
// Publisher가 제공한 데이터를 특정 객체의 키패스에 할당








//: [Next](@next)


