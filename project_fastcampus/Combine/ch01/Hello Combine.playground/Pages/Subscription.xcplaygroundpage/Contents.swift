//: [Previous](@previous)

import Foundation
import Combine

//MARK: Subscription
/*
 : Publisher와 Subscriber가 연결됨을 나타내는 구독 티켓
1. Subscription은 Publisher가 Subscriber에게 제공한다.
2. Subscription이 있으면 데이터를 받을 수 있다.
3. Subscription이 없으면 구독 관계가 취소된다.(Subscription으로 연결 관계를 취소할 수 있다.)
*/

let subject = PassthroughSubject<String, Never>()
let subscription1 = subject
    .print("Debug: ")
    .sink { value in
    print("Received Value: \(value)")
}

subject.send("hello")
subject.send("hello two")
subject.send("hello last chance")

// subject.send(completion: .finished) // Publisher가 구독 관계 해제
subscription1.cancel() // Subscriber가 구독 관계 해제
subject.send("hello ??")


// The print() operator prints you all lifecycle events


//: [Next](@next)
