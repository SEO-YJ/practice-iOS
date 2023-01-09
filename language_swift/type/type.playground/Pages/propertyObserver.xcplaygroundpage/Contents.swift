//: [Previous](@previous)

import Foundation

//MARK: 프로퍼티 감시자(Property Observer)
// 프로퍼티 감시자는 '저장 프로퍼티의 저장되는 값'이 변경될 때 원하는 동작을 수행할 수 있다.
/*
 willSet: 해당 프로퍼티의 값이 앞으로 newValue 값으로 바뀔거다.
 (아직 프로퍼티의 값이 바뀌지 않은 상태)
 newValue: 할당해 준 값
 
 didSet: 해당 프로퍼티의 값이 oldValue에서 현재 프로퍼티 값으로 바뀌었다.
 (이미 프로퍼티의 값이 바뀐 상태)
 oldValue: 이전의 프로퍼티가 가지고 있던 값
 */
struct Money {
    var currencyRate: Double = 1000 {
        willSet(newRate) {
            print("currencyRate가 \(currencyRate)에서 \(newRate)로 바뀔 예정이다.")
        }
        
        didSet(oldRate) {
            print("currencyRate가 \(oldRate)에서 \(currencyRate)로 바뀌었다. ")
        }
    }
    
    var dollar: Double = 0 {
        willSet {
            print("dollar가 \(dollar)에서 \(newValue)로 변경됩니다.")
        }
        
        didSet {
            print("dollar가 \(oldValue)에서 \(dollar)로 변경되었습니다.")
        }
    }
    
    // 프로퍼티 감시자는 연산 프로퍼티에서는 사용할 수 없다.
    var won: Double {
        get {
            return dollar * currencyRate
        }
        
        set {
            dollar = newValue / currencyRate
        }
    }
}


var won: Money = Money()
won.currencyRate = 2000
won.dollar = 20

// 연산 프로퍼티에 값을 할당하여 저장 프로퍼티의 값이 변경 될 경우에도 마찬가지로 프로퍼티 연산자가 호출된다.
won.won = 10000

//: [Next](@next)
