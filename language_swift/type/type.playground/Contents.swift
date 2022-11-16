import UIKit
import Foundation

/*
타입(Type)
정의
: 데이터와 기능을 용도에 맞게 묶어 구조화한 것.
 객체의 설계도라고 생각.
 
특징
 1. 타입은 인스턴스(객체)로 메모리에 생성할 수 있다.
 2. 인스턴스를 통해 타입에 설계된 기능, 동작 등을 수행할 수 있다.
 3. 한 모듈 내에서 타입의 이름은 유일 해야 한다.

타입의 종류
1. 열거형(Enumeration)
2. 구조체(Struct)
3. 클래스(Class)

타입을 정의하는 방법
1. 이름은 꼭 대문자로 시작
 
추가 개념
1. 값 타입(Value Type)
2. 참조 타입(Reference Type)
3. 상속 (Inheritance)
*/

struct Computer {
    var battery: Int = 100
    let manufacturer: String = "Apple"

    func saveData() {
        print("데이터를 저장합니다.")
    }

    func playVideo() {
        print("영상을 재생합니다.")
    }
}

/*
타입 내부 구성
 1. 변수, 상수: 속성(Property)
 2. 함수: 메소드(Method)
 
프로퍼티의 종류
 1. 타입 프로퍼티
 2. 인스턴스 프로퍼티
 
메소드의 종류
 1. 타입 메소드
 2. 인스턴스 메소드

타입 심화
1. 중첩 타입(Nested Type)으로 설계
*/
struct SoccerPlayer {
    enum Position {
        case goalKeeper, wing, back, forward
    }
    
    let name: String
    var position: SoccerPlayer.Position
    
    func shoot() {
        print("\(position)인 \(name)선수가 슛을 찹니다!")
    }
}

struct BasketballPlayer {
    enum Position {
        case center, forward, `guard`
    }
    
    let name: String = ""
    var position: BasketballPlayer.Position
}

// 타입을 이용한 인스턴스 생성
// 구조체의 경우 인스턴스 생성시 인스턴스 프로퍼티의 값을 할당해 주어야 한다.
var son: SoccerPlayer = SoccerPlayer(name: "손흥민", position: .forward)
var hwang: SoccerPlayer = SoccerPlayer(name: "황희찬", position: .wing)

// 인스턴스를 생성하면, 타입의 내부 메소드를 .을 이용해 호출 할 수 있다.
son.shoot()

son.position = SoccerPlayer.Position.goalKeeper
son.shoot()

