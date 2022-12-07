//: [Previous](@previous)

import Foundation
import Combine

// Publisher & Subscriber
// 여러가지 빌트인 Publisher
 
//MARK: Just Publisher
let just = Just(1000) // Publisher
// Just Publisher 특징
// 1. 데이터를 한 번 전송하면 끝

// 1. 반환 X
// 2. 단축 인자 이름 가능
let subscription1 = just.sink { value in
    print("Received value: \(value)")
}
// sink Subscriver 특징
// Publisher가 제공한 데이터를 받을 수 있는 클로저를 제공한다.

//MARK: .publisher Publisher
// .publisher 이용
let arrayPublisher = [1, 3, 5, 7, 9].publisher
let subscription2 = arrayPublisher.sink { value in
    print("Received value: \(value)")
}

//MARK: assign Subscriber
class MyClass {
    var property: Int = 0 {
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
print(object.property)
// object.property = 3

// assign Subscriber 특징
// Publisher가 제공한 데이터를 특정 객체의 키패스에 할당








//: [Next](@next)


