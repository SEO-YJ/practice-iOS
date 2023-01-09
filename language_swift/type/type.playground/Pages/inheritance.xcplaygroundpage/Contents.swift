//: [Previous](@previous)
import UIKit
import Foundation

// 슈퍼 클래스
class Person {
    var weight = 50
    
    func eat() {
        weight += 1
    }
}

// 서브 클래스
class Student: Person {
    var mathScore = 100
    
    func study() {
        mathScore += 3
    }
    
    override func eat() {
        weight += 5
    }
    
    func eatAsPerson() {
        super.eat()
    }
}

let jason = Student()

jason.weight
jason.eat()
jason.weight
jason.eatAsPerson()
jason.weight

jason.mathScore
jason.study()
jason.mathScore
//: [Next](@next)
