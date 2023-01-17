//: [Previous](@previous)

import Foundation
import Combine

/*
 Operator

 - Publisher 에게 받은 값을 가공해서 Subscriber 에게 제공
 - Input, Output, Failure type 을 받는데 타입이 다를수 있음
 - 빌트인 오퍼레이터가 많이 있음
     - map, filter, reduce, collect, combineLatest ....
 */

// Transform - Map
 let numPublisher = PassthroughSubject<Int, Never>()
let subscription1 = numPublisher
    .map{ $0 * 2 }
    .sink { value in
    print("Transformed Value: \(value)")
}
numPublisher.send(100)
numPublisher.send(200)
numPublisher.send(300)
subscription1.cancel()

// Filter
let stringPublisher = PassthroughSubject<String, Never>()
let subscription2 = stringPublisher
    .filter{ $0.contains("a")}
    .sink { value in
        print("Filtered Value: \(value)")
    }
stringPublisher.send("gaad")
stringPublisher.send("hello")
stringPublisher.send("yujun")
subscription2.cancel()

//: [Next](@next)
