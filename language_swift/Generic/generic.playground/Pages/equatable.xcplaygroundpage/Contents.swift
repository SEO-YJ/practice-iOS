//: [Previous](@previous)
//MARK: Equatable
/*
 1. Protocol
 2. 값이 동일한지 비교할 수 있는 타입
 3. Equatable 프로토콜을 준수하는 타입은 ==, != 비교 연산자 사용 가능
 4. 기본 데이터 타입은 모두 Equatable 프로토콜을 준수하여 비교 연산자를 사용할 수 있다.
 
 중요 사항
 1. 그러면, 사용자 정의 타입에 Equatable 프로토콜을 준수하면 비교 연산자를 사용할 수 있을까?
 
 */

class AClass: Equatable {
    var value: Int
    
    init(_ value: Int) {
        self.value = value
    }
    
    public static func == (lhs: AClass, rhs: AClass) -> Bool {
        return lhs.value == rhs.value
    }
}

var a = AClass(5)
var b = AClass(10)

if a == b {
    print("the same")
} else {
    print("different")
}
//: [Next](@next)
