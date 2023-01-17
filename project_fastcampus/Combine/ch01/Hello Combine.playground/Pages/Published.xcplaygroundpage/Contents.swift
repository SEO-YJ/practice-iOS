//: [Previous](@previous)

import Foundation
import UIKit
import Combine
/*
 # @Published (Publisher)

 - `@Published` 로 선언된 프로퍼티를 퍼블리셔로 만들어줌
 - 클래스에 한해서 사용됨 (구조체에서 사용안됨)
 - `$` 를 이용해서 퍼블리셔에 접근할수 있음
 */

/*
 1. ViewModel의 데이터가 바뀐다.
 2. UILabel의 텍스트가 바뀌어야 한다.
 3. ViewModel의 데이터를 Publisher로 선언한다.
 4. UILabel의 텍스트를 Subscriber로 데이터를 받는다.
 5. ViewModel의 데이터가 바뀔 때마다, UILabel의 텍스트도 바뀐다.
 */
final class SomeViewModel {
    @Published var name: String = "Jack" // Publisher로 선언
    var age: Int = 20
}

final class Label {
    var text: String = ""
}

let label = Label()
let vm = SomeViewModel()
print("Text: \(label.text)")

vm.$name.assign(to: \.text, on: label) // UILabel의 텍스트를 subscriber로 선언
print("Text: \(label.text)")

vm.name = "yujun" // ViewModel의 데이터값 변경
print("Text: \(label.text)") // UILabel의 텍스트 변경
//: [Next](@next)
