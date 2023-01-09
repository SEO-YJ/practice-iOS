//: [Previous](@previous)

import UIKit
import Foundation

//MARK: Instance
/*
정의: 타입을 통해 생성한 실체
 */

struct Phone {
    // Instance Property
    var battery: Int = 100
    var model: String = "galaxy Note"
    let manufacturer: String = "Samsung" // 상수로 선언시 값 변경 불가
    

    func talkOnThePhone() {
        print("전화를 합니다.")
    }

    func takePhoto() {
        print("사진을 찍습니다.")
    }
}

var myGalaxyNote20: Phone = Phone()    // Phone.init()과 동일한 표현
// 인스턴스 프로퍼티 값 변경
myGalaxyNote20.battery = 96
// 인스턴스 메소드 동작 실행
myGalaxyNote20.takePhoto()
myGalaxyNote20.talkOnThePhone()


 /*
var myGalaxyNote20: Phone = Phone()
  1. Phone(): Phone 타입의 인스턴스를 생성
  2. Phone.init() 이라는 코드를 축약하여 Phone()으로 작성할 수 있다.

myGalaxyNote20.battery = 96
  1. 인스턴스 프로퍼티인 battery에 새로운 값 할당
  2. 프로퍼티를 변수로 선언할 경우, 프로퍼티 값을 바꾸어 줄 수 있다.

myGalaxyNote20.takePhoto()
  1. 인스턴스의 메소드인 takePhoto() 메소드를 실행
  2. 호출(call) 한다고 함.
  3. 인스턴스 변수의 이름 적고, 점(.) 찍고, 소괄호를 열고, 전달인자가 있으면 전달해주어야 메소드를 호출할 수 있다.
*/

//MARK: Generating and Extincting of Instance

/*
 1. 타입의 이니셜라이저를 통해 인스턴스의 생성과 초기화를 해줄 수 있다.
 2. ()는 .init()의 축약이다.
 3. 인스턴스의 소멸시점에 특별한 처리를 해야 할 경우, deinit 메소드를 통해 소멸 시점에 처리해야 할 동작을 코드로 작성한다.
 */

/*
인스턴스의 초기화 과정 규칙
 1. 스위프트는 안전함을 지향하는 언어이다.
 2. 인스턴스의 초기화 규칙 중 가장 중요한 것은 '프로퍼티에 항상 값이 있어야 한다.'
 3. '프로퍼티에 항상 값이 있어야 한다?를 만족시키는 방법'
    1) 인스턴스 초기화 시에 이니셜라이저 내부에서 프로퍼티의 값을 초기화한다. (프로퍼티 기본값을 할당할 필요가 없을 경우)
    2) 인스턴스 프로퍼티가 기본값을 가지고 있다.(타입을 정의할 때, 프로퍼티에 기본값을 할당해 둔다.)
 */
//MARK: 스위프트의 안전함 테스트
// 1. 변수, 상수에 값을 할당하지 않고, 해당 변수, 상수에 접근할 경우
var myGalaxyNote21: Phone
// Runtime Error: Variable 'myGalaxyNote21' used before being initialized
// initialize: 초기 내용을 설정하다.
// initialized: 초기화된
// myGalaxyNote21.talkOnThePhone()

// 2. 옵셔널 변수에 값을 할당하지 않고, 해당 변수, 상수에 접근할 경우
var myGalaxyNote22: Phone?
myGalaxyNote22?.talkOnThePhone()
print(myGalaxyNote22) // nil 출력
// Runtime Error: X
// 옵셔널은 안전장치이다.
// 값이 있거나, 없을 경우 둘 다 허용한다.
// 값이 없으면 해당 변수는 nil 값을 갖는다.

//MARK: 인스턴스의 초기화 과정 규칙
// 프로퍼티에 값이 항상 보장되어야 한다.
// 1. 타입 정의시 프로퍼티에 기본값 할당
// 2. 이니셜라이저 내부에서 프로퍼티 값을 할당

// 1번
struct Macbook {
    var battery: Int = 100
    var account: String
    let manufacture: String = "Apple"
    let cpu: String = "M1"
    let name: String = "MacBook Air"
    
}

// 2번
var myMac: Macbook = Macbook(account: "seo")

print(myMac.battery)
print(myMac.account)


//MARK: 프로퍼티 기본값
// 1. 인스턴스는 초기화와 동시에 모든 프로퍼티에 값이 할당되어 있어야 한다.
// 2. 프로퍼티에 값을 항상 보장하는 방법
//      1) 타입을 정의할 때, 기본값을 할당한다.
//      2) 인스턴스를 초기화할 때, 이니셜라이저를 통해 기본값이 할당되지 않은 프로퍼티에 값을 할당한다.
// 3. 타입의 프로퍼티에 기본값을 할당하면, 인스턴스가 생성되면서 초기값을 가지게 된다.
// 4. 인스턴스를 상수로 선언하여도, 인스턴스의 저장 프로퍼티가 변수로 선언되어 있으면, 다른 값을 할당할 수 있다.

// 1. 타입의 저장 프로퍼티에 모두 기본값을 할당한 경우
// 모든 프로퍼티의 종류는 우선은 모두 저장 프로퍼티라고 생각하자.
class Car {
    var model: String = "unknown"
    var year: Int = 0
}

// 인스턴스 생성
let morning: Car = Car()
// 기본값이 인스턴스가 지녀야 할 값과 맞지 않다면
// 생성된 인스턴스의 프로퍼티에 각각 값 할당
morning.model = "morning"
morning.year = 5




//MARK: 이니셜라이저
// 1. 타입의 저장 프로퍼티에 기본값을 할당할 필요가 없을 경우에, 이니셜라이저를 이용해 내부에 저장 프로퍼티의 값을 할당하여 초기값 전달
// 2. 구조체(Struct)의 경우에는 자동으로 이니셜라이저 생성
// 3. 클래스(Class)의 경우에는 저장 프로퍼티에 기본값이 할당되어 있지 않은 경우, 초기값을 전달받기 위한 이니셜라이저를 타입 내부에 정의해야 한다.

// 클래스의 이니셜라이저 정의
class Train {
    var model: String
    var year: Int
    var width: Int
    var height: Int
    var countSeat: Int
    
    // 이니셜라이저
    // self: 현재 인스턴스
    init(model: String, year: Int, width: Int, height: Int, countSeat: Int) {
        self.model = model
        self.year = year
        self.width = width
        self.height = height
        self.countSeat = countSeat
    }
}

// 하나의 타입으로 여러 인스턴스를 생성할 수 있다.
// 인스턴스를 생성시에
// .init(), () 두 가지 방법 다 가능하다.
// 왜냐하면, ()은 .init()의 축약형이기 때문이다.
let ktxTrain: Train = Train.init(model: "KTX", year: 3, width: 100, height: 3, countSeat: 50)
let newCountyTrain: Train = Train(model: "newCountry", year: 10, width: 80, height: 3, countSeat: 60)


//MARK: 타입의 저장 프로퍼티와 옵셔널
// 프로퍼티에 값을 항상 보장하는 방법
//      1) 타입을 정의할 때, 기본값을 할당한다.
//      2) 인스턴스를 초기화할 때, 이니셜라이저에 기본값이 할당되지 않은 프로퍼티에 값을 할당한다.
//      3) 타입의 프로퍼티의 타입을 옵셔널로 선언한다.(초기값이 필요 없을 경우에 사용)

// 프로퍼티의 타입을 옵셔널로 선언할 경우
// 이니셜라이저를 값이 있는 경우와, 없는 경우로 생성

class GalaxyBuds {
    let model: String
    let color: String
    var generation: Int
    var caseColor: String?
    
    convenience init(model: String, color: String, generation: Int, caseColor: String) {
        self.init(model: model, color: color, generation: generation)
        self.caseColor = caseColor
    }
    
    init(model: String, color: String, generation: Int) {
        self.model = model
        self.color = color
        self.generation = generation
    }
}

let myBuds: GalaxyBuds = GalaxyBuds(model: "buds1", color: "white", generation: 1)
let hisBuds: GalaxyBuds = GalaxyBuds(model: "buds2", color: "black", generation: 2, caseColor: "white")

myBuds.caseColor
hisBuds.caseColor


//MARK: 암시적 추출 옵셔널
// 인스턴스 사용시에 꼭 필요한 프로퍼티이지만, 초기값을 할당할 하지 않고자 할 때 사용

class GalaxyUser {
    var name: String
    var age: Int
    var earPhone: GalaxyBuds!
    var cellPhone: Phone!
    
    init(name: String, age: Int) {
        self.name = name
        self.age = age
    }
    // 메소드에서는 self 명시 안해주고, 저장 프로퍼티 변수명 가져다가 사용
    func printUsersMachine() {
        print("유저 이름: \(name)")
        print("유저 나이: \(age)")
        print("유저가 사용하는 이어폰: \(earPhone.model)")
        print("유저가 사용한는 휴대폰: \(cellPhone.model)")
    }
}
let myUser: GalaxyUser = GalaxyUser(name: "seo", age: 24)
myUser.earPhone = myBuds
myUser.cellPhone = myGalaxyNote20
myUser.printUsersMachine()


//MARK: 실패 가능성이 있는 이니셜라이저
// 잘못된 초기값이 이니셜라이저로 전달된 경우, 인스턴스 생성에 실패할 수 있다.
// 인스턴스 생성에 실패할 경우 nil 반환
// 인스턴스 생성을 성공할 수도, 실패할 수도 있으므로 이니셜라이저의 반환 타입은 옵셔널

// 구성
// 1. init?을 사용하여 이니셜라이저를 정의
// 2. 인스턴스 생성시 타입에 옵셔널 처리

class SEOViewController {
    var width: Int
    var height: Int
    var storyboardID: String?
    
    init?(width: Int, height: Int) {
        if (0...500).contains(width) == false {
            return nil
        }
        if (0...500).contains(height) == false {
            return nil
        }
        self.width = width
        self.height = height
    }
}

let firstViewController: SEOViewController? = SEOViewController(width: 600, height: 300)
let secondViewController: SEOViewController? = SEOViewController(width: 200, height: -100)
print(firstViewController)
print(secondViewController)



//MARK: 디이니셜라이저
// 클래스(열거형, 구조체 X)의 인스턴스가 메모리에서 해제되는 시점에 호출
// 인스턴스가 해제되는 시점에 실행해야하는 동작들을 구현할 수 있다.
// 직접 호출할 수 X, 자동으로 호출됨

class Appleuser {
    var name: String
    var applePhone: Phone?
    var appleMac: Macbook
    init(name: String, appleMac: Macbook) {
        self.name = name
        self.appleMac = appleMac
    }
    
    deinit {
        if let applephone = applePhone?.model {
            print("애플 유저 \(name)의 아이폰 모델명은 \(applephone)입니다!")
            print("유저의 \(applephone)이 아이폰 14 pro로 업그레이드 되었습니다!")
            self.applePhone?.model = "아이폰 14 pro"
        }
    }
}

var appleUserPhone: Phone = Phone()
appleUserPhone.model = "아이폰 13 mini"


var appleUserSeo: Appleuser? = Appleuser(name: "Seo Bruno", appleMac: myMac)
appleUserSeo?.applePhone = appleUserPhone
appleUserSeo = nil
// appleUserSeo 인스턴스를 메모리에서 해제하여 디이니셜라이저 호출
// 애플 유저 Seo Bruno의 아이폰 모델명은 아이폰 13 mini입니다!
// 유저의 아이폰 13 mini이 아이폰 14 pro로 업그레이드 되었습니다!


//: [Next](@next)
