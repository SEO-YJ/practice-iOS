import Foundation
import Combine
//Subject


//MARK: PassthroughSubject
// : 전달할 값을 들고 있지 않고 데이터를 바로 전달해주는 Publisher
let relay = PassthroughSubject<String, Never>()
// Output Type: String
// Failure Type: Never

let subscription1 = relay.sink { value in
    print("Subscription1 Received Value: \(value)")
}

// send(_:)  메소드를 이용해서 이벤트 값을 주입시킬수 있는 퍼블리셔
relay.send("hello")
relay.send("yoyo")
print()



//MARK: CurrentValueSubject
// : 전달한 값을 들고 있어 최근에 보낸 데이터를 알 수 있는 Publisher
let variable = CurrentValueSubject<String, Never>("")
// Output Type: String
// Failure Type: Never
// argument: 기존에 가지고 있는 데이터 필요

variable.send("Initial Value")

let subscription2 = variable.sink { value in
    print("Subscription2 Received Value: \(value)")
}

variable.send("currentHello")
variable.send("currrentYoyo")
variable.value
print()


//MARK: 여러 데이터를 Subject에게 전달할 경우
let publisher = ["Here", "We", "Go"].publisher
// publisher.subscribe(relay)
publisher.subscribe(variable)
variable.value


