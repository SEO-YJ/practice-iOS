import UIKit
//참고링크
/*
 http://yoonbumtae.com/?p=4505
 */

//MARK: 제네릭
/*
 데이터의 타입에 의존하지 않고,
 하나의 값이 여러 데이터 타입 값을 가지게 함으로써
 코드의 재사용성을 높이기 위함.
 
 */



//MARK: 제네릭 함수
/*
 T: 타입 파라미터라고 부르며, 제네릭 함수의 경우 매개변수에 placeholder 타입이름을 사용한다.
 <T>: 컴파일러에게 이 함수의 placeholder 타입 이름을 알려준다.
 여러 개의 placeholder 타입이름을 사용할 수 있다.
 
 함수에 가상의 타입을 사용한다고 생각하면 된다.
 
 placeholder 타입이름으로 기본 데이터 타입 이름을 사용해도 된다. (Int, Double, Object)
 제네릭 타입으로 이런 이름을 사용하더라도
 실제 Int 타입이 되는 것이 아니라 'placeholder 타입으로서의 Int'가 됩니다.
 */
func swapTwoValues<T, V>(_ a: inout T, _ b: inout T, _ c: inout V, _ d: inout V) {
    let tempA = a
    a = b
    b = tempA
    
    let tempB = c
    c = d
    d = tempB
}

var aInt = 10
var bInt = 20
var aString = "yujun"
var bString = "jonghun"
swapTwoValues(&aInt, &bInt, &aString, &bString)

print("\(aInt)와 \(bInt)값이 변경되었다!")
print("\(aString)와 \(bString)값이 변경되었다!")

func swapTwoYujun<Yujun>(_ a: inout Yujun, _ b: inout Yujun) {
    let tempA = a
    a = b
    b = tempA
}

var aYujun = 500
var bYujun = 1000
swapTwoYujun(&aYujun, &bYujun)
print(aYujun, bYujun)

//MARK: 타입 파라미터 T
/*

 */
// 타입 파라미터 예시: Dictionary
var dic1 = [1: "one", 2: "two"]
for (key, value) in dic1 {
    print(key, value)
}

var dic2 = [10.5: "ten dot five", 20.5: "twelve dot five"]
for (yo, bro) in dic2 {
    print(yo, bro)
}

/*
 1. key, value는 위 제네릭 함수의 T와 같은 '타입 파라미터'이다.
 타입 파라미터는 placeholer 타입 이름으로써, 이는 실제 타입이 아니라
 반복문이 실행될 때 실제 타입이 결정된다.
 
 2. key, value 대신 다른 이름을 사용해도 상관없다.
 왜냐하면 이 부분은 타입 파라미터여서 placeholder이기 때문이다.
 그러나, 위 반복문은 'Dictionary'를 사용하여 요소를 반복하는 반복문이기에,
 Dictionary의 실제 요소가 key, value로 구성되어 있어서
 Dictionary와 '관계'가 있는 이름이다.
 타입 파라미터의 이름은 '자신의 역할이 내포된 이름'으로 작성하는 것이 좋다.
 그러기에, key, value로 작성한 것이다.
 
 하지만, 위 swapTwoValues와 같은 함수는 타입 파라미터와 의미있는 관계가 없으므로,
 이럴 경우에는 단일문자 (T, V)와 같은 것을 타입 파라미터의 이름으로 사용한다.
 */

//MARK: 타입 제약(Type Constraint)
/*
 제네릭 함수 사용에 제약 걸기
 1. 타입 파라미터가 특정 클래스를 상속되는 경우
 2. 타입 파라미터가 특정 프로토콜을 준수하는 경우
 */

// Ex> Dictionary
/*
 Dictionary는 Generic Collection이다.
 key, value에 다양한 타입이 들어올 수 있다.
 하지만, key에는 타입 제약이 걸려있다.
 Hashable 프로토콜을 준수하는 타입만 들어올 수 있다.
 */
var arr: [Any] = [1, "hello", 3]
for value in arr {
    print(value)
}

var dic: [AnyHashable: Any] = [1: "one", 2.5: 2, "hi": 3]
for (key, value) in dic {
    print(key, value)
}

//MARK: 타입 제약 Generic 함수 만들어보기
/*
 타입 제약 함수 Syntax
func someFunction<T: SomeClass, U: SomeProtocol>(someT: T, someU: U) {
    
}
 */
/*
 내 생각
 T라는 placeholder 타입 이름은 SomeClass를 상속 받는 타입이어야 하고,
 U라는 placeholder 타입 이름은 SomeProtocol을 준수하는 타입이어야 한다?
 
 답
 타입 제약(Type Constraints)를 준것
 T는 SomeClass의 하위 클래스여야 한다.
 U는 SomeProtocol을 준수해야 한다.
 */

func findIndex<T: Equatable>(ofString valueToFind: T, in array: [T]) -> Int? {
    for (index, value) in array.enumerated() {
        if value == valueToFind {
            return index
        }
    }
    return nil
}

var arrInt = [1, 2, 3, 4, 5, 6]
var arrValue = 4
print("Index 값은:", findIndex(ofString: arrValue, in: arrInt)!)


//MARK: 제네릭 타입
/*
 Class, Struct, Enum 등 사용자 정의 타입에서도
 제네릭 타입을 정의할 수 있다.
 */

// 사용자 정의 스택 구현
// Int 타입 스택 구현
struct IntStack {
    var items: [Int] = []
    
    mutating func push(_ item: Int) {
        items.append(item)
    }
    
    mutating func pop() -> Int {
        return items.removeLast()
    }
}

var intStack = IntStack(items: [1, 3, 5, 7, 9])
intStack.push(100)
intStack.items
intStack.pop()
intStack.pop()
intStack.items



// 사용자 정의 스택 구현
// Generic 타입 스택 구현
struct GenericStack<T> {
    var items: [T] = []
    
    mutating func push(_ item: T) {
        items.append(item)
    }
    
    mutating func pop() -> T {
        return items.removeLast()
    }
}

var anyStack = GenericStack(items: ["hi", "good", "bye"])
// 제네릭 타입의 가상의 타입(placeholder 타입)이 String으로 정해진다.
anyStack.push("yoyo")
anyStack.items

extension GenericStack {
    var topItem: T? {
        return items.isEmpty ? nil : items[items.count - 1]
    }
}

anyStack.topItem




