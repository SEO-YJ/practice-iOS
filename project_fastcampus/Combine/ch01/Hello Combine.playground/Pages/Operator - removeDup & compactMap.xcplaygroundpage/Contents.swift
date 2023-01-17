//: [Previous](@previous)

import Foundation
import Combine

var subscriptions = Set<AnyCancellable>()

// removeDuplicates
/*
 같은 데이터가 들어올 때, 중복되는 데이터는 필요가 없으므로 제거하는 Operator
 */
let words = "hey hey there! Mr Mr ?"
    .components(separatedBy: " ")
    .publisher
words
    .removeDuplicates()
    .sink { value in
        print("\(value)")
    }.store(in: &subscriptions) // 컬렉션에 데이터 저장

// compactMap
/*
 데이터를 transform 하였는데, nil 값이 될 경우 보내지 않고,
 제대로 변환이 된 경우에만 Output을 보내는 Operator
 */

let strings = ["a", "1.24", "3", "def", "45", "0.23"].publisher

strings
    .compactMap {  Float($0) }
    .sink { value in
        print("\(value)")
    }.store(in: &subscriptions)


// ignoreOutput
/*
 Publisher에 대해서 데이터를 다 받은 경우,
 새로 들어오는 데이터에 대해서 신경쓰고 싶지 않을 때 사용하는 Operator
 */
let numbers = (1...10_000).publisher

numbers
    .ignoreOutput()
    .sink(receiveCompletion: { print("Completed with: \($0)")}, receiveValue: {print($0)})
    .store(in: &subscriptions)

// prefix
/*
 여러 데이터를 받는 중에 앞에 몇 개의 데이터만 받고 싶을 때 사용하는 Operator
 */
let tens = (1...10).publisher

tens
    .prefix(5)
    .sink(receiveCompletion: {print("Completed with: \($0)")}, receiveValue: {print($0)})
    .store(in: &subscriptions)

//: [Next](@next)
