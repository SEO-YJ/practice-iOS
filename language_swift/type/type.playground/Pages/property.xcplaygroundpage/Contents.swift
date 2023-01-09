//: [Previous](@previous)

import Foundation
//MARK: 프로퍼티 종류
/*
 저장 프로퍼티(stored property)
 연산 프로퍼티(computed property)
 인스턴스 프로퍼티(instance property)
 타입 프로퍼티(type property)
 */

/*
 프로퍼티 특징
 1. 열거형(enum)은 오직 '연산 프로퍼티(computed property)' 만 가질 수 있다.
 2. '연산 프로퍼티(computed property)'는 오직 변수(var)로만 선언할 수 있다.
 
 
 */

struct Student {
    // 인스턴스 저장 프로퍼티
    var name: String = " "
    var className: String = "Swift"
    var koreanAge: Int = 0
    
    // 인스턴스 연산 프로퍼티
    /*
     연산 프로퍼티는 '값을 연산' 해주는 프로퍼티
     
     get
     다른 저장 프로퍼티의 값을 연산하여 반환해준다.
     
     set
     다른 저장 프로퍼티의 값을 연산하여 할당해준다.
     set 옆에 매개변수를 작성하지 않을 경우,
     'newValue'라는 값으로 암시적으로 사용할 수 있다.
     */
    var westernAge: Int {
        get {
            return koreanAge - 1
        }
        
        set {
            koreanAge = newValue + 1
        }
    }
    
    // 타입 저장 프로퍼티
    // 타입의 객체를 생성하지 않아도, 타입의 이름만으로 값을 사용할 수 있다.
    static var typeDescription: String = "학생"
    
    // 읽기 전용 인스턴스 연산 프로퍼티
    /*
     get 만 구현되어 있다.
     쓰기 전용 인스턴스 연산 프로퍼티는 없다.
     만약에 쓰기 전용이라는 것이 있으면, 사용할 수가 없으므로 굳이 필요 없지 않을까 싶다.
     
     인스턴스 프로퍼티와 타입 프로퍼티는 동일한 이름을 사용할 수 있다.
     왜냐하면,
     타입 프로퍼티는 타입의 이름을 통해서만 사용 가능하고 인스턴스를 생성하여서는 접근할 수 없다.
     인스턴스 프로퍼티는 오직 인스턴스를 생성하여서 사용할 수 있다.
     */
    var selfIntroduction: String {
        get {
            return "저는 \(self.className)반 \(self.name)입니다."
        }
    }
    
    // 읽기 전용 타입 연산 프로퍼티
    // 읽기 전용에서는 get을 생략할 수 있다.
    static var selfIntroduction: String {
        return "학생타입입니다."
    }
}

/*
 Test1: 인스턴스 연산 프로퍼티 테스트
 
var yujun: Student = Student()
yujun.westernAge = 20
print(yujun.koreanAge)
print(yujun.westernAge)

yujun.koreanAge = 15
print(yujun.koreanAge)
print(yujun.westernAge)
 */
// Test2: 타입 저장 프로퍼티 테스트
Student.typeDescription = "타입 저장 프로퍼티 입니다."
print(Student.typeDescription)

// Static member 'typeDescription' cannot be used on instance of type 'Student'
// 타입 저장 프로퍼티인 typeDescription은 인스턴스 저장 프로퍼티로 사용될 수 없다.
/*
var yujun: Student = Student()
print(yujun.typeDescription)
 */

// Test3: 타입 연산 프로퍼티 테스트
print(Student.selfIntroduction)

// Test4: 읽기 전용 인스턴스 연산 프로퍼티 테스트
var yujun: Student = Student()
yujun.name = "yujun"
yujun.koreanAge = 24

print(yujun.selfIntroduction)
 
//MARK: 프로퍼티 응용
struct Money {
    var currencyRate: Double
    var dollar: Double = 0
    var won: Double {
        get {
            return dollar * currencyRate
        }
        
        set {
            dollar = newValue / currencyRate
        }
    }
}

var moneyInMyPocket: Money = Money(currencyRate: 1100)
moneyInMyPocket.dollar = 10
print(moneyInMyPocket.won)

moneyInMyPocket.won = 20000
print(moneyInMyPocket.dollar)

//MARK: 지역변수, 전역변수
var a: Int = 100
var b: Int = 200
var sum: Int {
    return a + b
}
print(sum)
//: [Next](@next)
