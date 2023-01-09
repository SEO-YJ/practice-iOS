//: [Previous](@previous)

import Foundation
import UIKit

//MARK: 구조체와 클래스의 차이
// 1. 생성자(initializers), 2. 상속(inheritance)
/*
 구조체는 상속이 불가 -> Swift에서 자동화된 기능을 제공
 클래스는 상속이 가능 -> 설계상 해당 클래스가 서브 클래스에서만 초기화 되어야 할 필요성이 있다. 즉, 상속 가능성에서 차이가 발생
 
 if 클래스에 자동화된 생성자가 존재할 경우...
 상속의 상황에서 오류가 발 생할 경우에
 개발자가 직접 변경하는 작업이 더 어렵다.
 */

// Class
// error: Class 'PersonA' has no initializers
// 에러: 해당 클래스는 생성자를 가지고 있지 않다.
// 클래스는 프로퍼티에 값이 할당되어 있지 않은 경우에,
// 1. 기본값 할당, 2. 생성자 생성, 3. 옵셔널 변수 설정

class Car {
    var name: String
    // var modelName: String
    init(name: String) {
        self.name = name
    }
}

class Lambo: Car {
    var engine: String
    init(name: String, engineName: String) {
        self.engine = engineName
        super.init(name: name)
    }
}

let myCar = Lambo(name: "hi", engineName: "hello")
print(myCar.engine)
print(myCar.name)

struct Person {
    var name: String
    var age: Int = 10
}

let yujun: Person = Person(name: "yujun")
/*
 memberwise init이 Class에 있을 경우
 
 // memberwise init이 name 프로퍼티를 정의해 줄 것이다.
 class Car {
 var name: String
 }
 
 class Lambo: Car {
 // var name: String
 
 }
 */
 
 // 3. mutating
 // struct는 자신의 프로퍼티의 값을 변경하는 메소드 앞에 mutating 키워드를 붙여줘야 한다.
class PersonA {
    var name: String
    var age: Int
    
    init(name: String, age: Int) {
        self.name = name
        self.age = age
    }
    
    func addOneToAge() {
        self.age += 1
    }
}

struct PersonB {
    var name: String
    var age: Int
    
    mutating func addOneToAge() {
        self.age += 1
    }
}

// 4. 값 타입 vs 참조 타입
// 클래스는 참조 타입
class EarphoneA {
    var color = "White"
}

// 구조체는 값 타입
struct EarphoneB {
    var color = "White"
}

func printEarphoneColor() {
    let str = """
Earphone A (my: \(myEarphoneA.color), yours: \(yourEarphoneA.color))
Earphone B (my: \(myEarphoneB.color). yours: \(yourEarphoneB.color))
"""
    print(str)
}

var myEarphoneA = EarphoneA()
var yourEarphoneA = myEarphoneA

var myEarphoneB = EarphoneB()
var yourEarphoneB = myEarphoneB

printEarphoneColor()


print("----- myEarphone 색을 변경합니다. -----")

myEarphoneA.color = "Green"
myEarphoneB.color = "Green"

printEarphoneColor()

// 값 타입 vs 참조 타입 예시 2
class ReferenceType {
    var instanceProperty = 1
}

struct ValueType {
    var instanceProperty = 1
    
    mutating func addValue() {
        instanceProperty += 10
    }
}

let referenceInstance1 = ReferenceType()
var referenceInstance2 = referenceInstance1

print(referenceInstance1.instanceProperty)
print(referenceInstance2.instanceProperty)

referenceInstance2.instanceProperty = 3

print(referenceInstance1.instanceProperty)
print(referenceInstance2.instanceProperty)

referenceInstance1.instanceProperty = 2

print(referenceInstance1.instanceProperty)
print(referenceInstance2.instanceProperty)

let valueInstance1 = ValueType()
var valueInstance2 = valueInstance1

print(valueInstance1.instanceProperty)
print(valueInstance2.instanceProperty)

// 구조체는 상수로 선언되면, 프로퍼티가 변수여도 변경할 수 없다.
// valueInstance1.instanceProperty = 3
// valueInstance1.addValue()
valueInstance2.addValue()

print(valueInstance1.instanceProperty)
print(valueInstance2.instanceProperty)

// 값 타입 vs 참조 타입 문제
// 1. 값 타입 이해 문제
struct SomeStruct {
    var someProperty: String = "property YUJUN Struct"
}

var someStructInstance = SomeStruct()

func someFunction(anyInstance: SomeStruct) {
    var anyStruct = anyInstance
    anyStruct.someProperty = "HELLO YUJUN Struct"
    print(anyStruct.someProperty)
}

someFunction(anyInstance: someStructInstance)
print(someStructInstance.someProperty)

// 2. 참조 타입 이해 문제
class SomeClass {
    var someProperty: String = "property YUJUN Class"
}

var someClassInstance = SomeClass()

func someClassFunction(anyClassInstance: SomeClass) {
    let anyClass = anyClassInstance
    anyClass.someProperty = "HELLO YUJUN Class"
    print(anyClass.someProperty)
}

someClassFunction(anyClassInstance: someClassInstance)
print(someClassInstance.someProperty)
//: [Next](@next)
