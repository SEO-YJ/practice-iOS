import Foundation
import os
///*
// { (매개변수 목록) -> 반환타입 in
//    실행 코드
// }
// */
//
//// 함수를 정의
//func sumFunction(a: Int, b: Int) -> Int {
//    return a + b
//}
//
//// 변수에 함수를 할당
//var sumResult: Int = sumFunction(a: 1, b: 2)
//print(sumResult)
//
///*
// 1. 매개변수가 없는 경우
// { () -> 반환타입 in
// 실행코드
// }
//
// 2. 반환타입이 없는 경우
// { (매개변수 목록) -> Void in
// 실행코드
// }
// */
//
//// 클로저를 정의와 동시에 변수에 할당
//// 함수를 선언하고, 변수에 함수를 할당할 필요 없이 한 번에 가능
//var sum: (Int, Int) -> Int = { (a: Int, b: Int) -> Int in
//    return a + b
//}
//
//sumResult = sum(3,4)
//print(sumResult)
//
//// 클로저로 선언한 변수에 함수를 할당 가능
//// 왜? 함수는 클로저의 일종이기에
//sum = sumFunction(a:b:)
//
//sumResult = sum(4,5)
//print(sumResult)
//
//let add: (Int, Int) -> Int
//add = { (a: Int, b: Int) -> Int in
//    return a + b
//}
//
//let substract: (Int, Int) -> Int
//substract = { (a: Int, b: Int) -> Int in
//    return a - b
//}
//
//let divide: (Int, Int) -> Int
//divide = { (a: Int, b: Int) -> Int in
//    return a / b
//}
//
//// 함수 안에서 전달 받은 클로저를 호출해준다.
//func calculate(a: Int, b: Int, method: (Int, Int) -> Int) -> Int {
//    return method(a, b)
//}
//
//print(calculate(a: 3, b: 4, method: substract))
//
//// 바로 클로저를 함수의 전달인자로 작성하여 전달 가능
//var calculated = calculate(a: 5, b: 6, method: { (left: Int, right: Int) -> Int in
//    return left * right
//})
//
//print(calculated)
//
//
////MARK: 클로저를 이용한 예시1 -> 이름 출력
//let printAnyway: (String) -> String
//printAnyway = { (name: String) -> String in
//    return name+" hello!"
//}
//
//print(printAnyway("yj"))
//
////MARK: 클로저를 이용한 예시2 -> 연산
//func divider(a: Int, b: Int, method: (Int, Int) -> Int) -> Int {
//    return method(a, b)
//}
//
//var trashValue: (Int, Int) -> Int = { (a: Int, b: Int) -> Int in
//    return a % b
//}
//
//print(divider(a: 5, b: 2, method: trashValue))
//print(divider(a: 8, b: 2, method: { (a: Int, b: Int) -> Int in
//    return a + b
//}))


//MARK: 1. 후행 클로저
// 함수의 마지막 전달인자로 클로저가 온다면, 매개변수의 이름을 생략한 후 함수 소괄호 외부에 클로저를 구현할 수 있다.
func calculate(a: Int, b: Int, method: (Int, Int) -> Int) -> Int {
    return method(a,b)
}

var result: Int

// 마지막 전달인자로 전달될 클로저
result = calculate(a: 10, b: 10) { (left: Int, right: Int) -> Int in
    return left + right
}

print(result)

//MARK: 2. 반환타입 생략
// 컴파일러가 반환타입을 추론할 수 있을 경우, 반환타입을 생략할 수 있다. 그러나 in 키워드는 생략할 수 없다.
result = calculate(a: 15, b: 15, method: { (left: Int, right: Int) in
    return left * right
})
print(result)

// 후행클로저 + 반환타입 생략
result = calculate(a: 20, b: 20) { (left: Int, right: Int) in
    return left - right
}
print(result)

//MARK: 3. 단축 인자 이름
// 클로저의 매개변수 이름이 불필요할 경우, 단축 인자 이름을 사용할 수 있다.
// in 도 생략 가능
result = calculate(a: 7, b: 8, method: {
    return $0 + $1
})
print(result)

// 후행 클로저와 사용할 경우
result = calculate(a: 30, b: 30) {
    return $0 + $1
}
print(result)

//MARK: 4. 암시적 반환 표현
// 클로저가 반환 값이 있을 경우, 클로저의 마지막 줄은 암시적으로 반환값으로 취급
result = calculate(a: 40, b: 40) {
    $0 + $1
}
print(result)
