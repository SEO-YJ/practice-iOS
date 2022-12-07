# Combine
 위 페이지는 "Combine"에 대해 정리한 페이지입니다.    
 
 ## RxSwift와 Combine
 RxSwift: 개발자들이 만든 비동기 처리 방식       
 Combine: 애플이 개발자들을 위해 만든 비동기 처리 방식
       
 ## Combine
Reactive Programming      
: RxSwift랑 Combine이랑 같은 개념       
     
SwiftUI에 제공되는 기능이나 객체들 중에 Combine으로 작동하는 객체들이 있다.      
     
전제 조건     
: iOS 13 이상을 지원해야 한다.     
       
 ## Hello Combine!
Async 101      
동기 작업: 요청(request)과 결과(response)가 동시에 발생하는 것     
ex> 오프라인으로 1대1 대화      
비동기 작업: 요청(request)과 결과(response)가 동시에 발생하지 않는 것      
ex> 이메일로 대화      
서버에서 데이터 받아서 페이지를 보여주기       
사용자의 버튼 인터렉션     

Combine을 사용하는 이유      
: 기존의 복잡한 비동기 처리 방식 대신에, 통일된 방식으로 비동기 처리할 수 있는 API를 Combine으로 제공      
     
## Combine Overview      
3가지 주요 컴포넌트      
1. Publisher: 생산자, 크리에이터, 배출자      
2. Subscriber: 소비자, 구독자, 받는 사람       
3. Operator: 변경시키는 사람, 가공자           
     
## Event Pipeline
Publisher -> Operator -> Subscriber      
: Publisher가 데이터를 제공한 것을, Operator가 데이터를 가공하여 Subscriber가 가공된 Data를 받는다.      

## Publisher
 ```swift
 protocol Publisher {
 associated Output
 associated Failure: Error
 
 func subscribe<S: Subscriber>(_ subscriber: S) {
    where S.Input == Output, S.Failure == Failure 
}
 ```

* 데이터를 배출한다.     
1. 구체적인 Output, Failure을 정의     
2. Subscriber가 요청한 것 만큼 데이터를 제공(func receive(_ input: Input) -> Subscribers.Demand)        
     
* 빌트인 Publisher가 있다.      
1. 'Just'는 값을 다룬다.      
2. 'Future'는 함수를 다룬다.       
      
* iOS에서 자동으로 제공하는 Publisher       
1. Notification Center      
2. Timer      
3. URLSession.dataTask       
       
## Subscriber     
```swift
protocol Subscriber {
associated Input     
associated Failure: Error      

func receive(subscription: Subscription)
func receive(_ input: Input) -> Subscribers.Demand
func receive(completion: Subscribers.Completion<Failure>)
} 
```      
* 데이터를 받는다.    
1. 무엇을 받을 지, 받지 못할 경우 실패 타입을 정의 해야 한다.     
     
* Publisher 에게 데이터를 요청한다.       
* Input, Failure 타입의 정의가 필요하다.     
* Publisher 구독 후, 갯수를 요청한다.     
* 파이프라인을 취소할 수 있다.     
      
* 빌트인 Subscriber가 있다.     
1. assign은 Publisher가 제공한 데이터를 특정 객체의 키패스에 할당     
2. sink는 Publisher가 제공한 데이터를 받을 수 있는 클로져를 제공     
      
## Subscriber & Publisher Pattern     
1. Subscriber가 Publisher에게 붙는다.     
2. Publisher가 Subscriber에게 subscription을 제공한다.      
3. Subscriber는 구독권이 생겼으니, N개의 데이터가 필요한지 요청한다.      
4. Publisher는 N개의 데이터를 제공하거나, 적게 제공한다.     
5. Publisher가 완료되었다고 Subscriber에게 completion을 제공한다.      
     
## Subscription   
: Subscriber와 Publisher가 연결됨을 나타내는 녀석     
     
1. Publisher가 발행한 구독 티켓     
2. 이 티켓이 있으면 Publisher가 데이터를 제공할 수 있고, 이것이 없으면 구독관계 사라짐     
3. Subscription은 Cancellable 프로토콜을 따르고 있어서, Subscription을 통해 구독관계를 cancel할 수 있음     

## Subject 
: 특별한 형태의 'Publisher'다.     

1. Send 메소드를 이용해서 이벤트 값을 주입시킬 수 있다.     
2. 기존의 복잡한 비동기처리 방식에서 Combine으로 쉽게 전환할 수 있다.      
     
### 빌트인 타입
1. PassthroughSubject      
    1) Subscriber가 데이터를 달라고 요청      
    2) 받은 값을 전달해주기만 함
    3) 전달한 값을 들고 있지 않음      
2. CurrentValueSubject      
    1) Subscriber가 데이터를 달라고 요청      
    2) 최근에 가지고 있던 값을 전달, 그 후 받은 값을 전달      
    3) 전달한 값을 들고 있음      
     
PassthroughSubject와 CurrentValueSubject의 공통점과 차이점      
공통점: Subscriber가 데이터를 달라고 요청하는 Publisher이다.     
차이점      
1. PassthroughSubject는 전달한 값을 들고 있지 않고, 그대로 Subscriber에게 제공한다.       
2. CurrentValueSubject는 최근에 전달한 값을 가지고 있고, 똑같은 데이터를 Subscriber에게 제공한다.       
     
## @Published 
: 클래스에 @Published로 프로퍼티를 선언하면 Publisher로 사용할 수 있다.      
     
```swift
// Weather 객체
class Weather {
    // Weather 객체의 프로퍼티
    @Published var temperature: Double      // temperature 프로퍼티를 @Published로 선언하여서 Publisher로 사용
    init(temperature: Double) {             
        self.temperature = temperature
    }
}

let weather = Weather(temperature: 20)     
// sink 메소드를 이용해서 Subscriber 생성
let subscription = weather.$temperature.sink {
    print("Temperature now: \($0)")
}
weather.temperature = 25

```

## Operator
: Publisher에게 제공받은 데이터를 가공하여 Subscriber에게 제공하는 역할      
     
특징    
1. 빌트인 Operator가 매우 많다.     
     
## Scheduler
: 언제, 어떻게 클로저를 실행할 지 정해주는 것     
     
특징     
1. Scheduler는 백그라운드나 메인 스레드에서 작업이 실행 되도록 도와주는 역할      

### 2가지 메소드
subscribe(on:): Publisher가 어느 스레드에서 수행할지 결정하는 것     
receive(on:): Operator, Subscriber가 어느 스레드에서 수행할지 결정하는 것       

Pattern      
```swift
// 서버로부터 데이터를 받아서, 그 데이터를 계속 방충해주는 방출자
let jsonPublisher = MyJSONLoaderPublisher()

jsonPublisher.subscribe(on: backgroundQueue) // 서버에서 받는 데이터이므로 Publisher는 백그라운드에서 실행
            .receive(on: RunLoop.main)       // UI업데이트를 할 떄는 메인스레드로 가져온다. 
                        .sink { value in
label.text = value
}
```

## Combine 실습
### Combine 실습 1
Publisher & Subscriber    

여러 가지 빌트인 Publisher     
1. Just     
: 데이터를 Subscriber에게 한 개 제공한다.      
```swift
let just = Just(1000)
1. Just 객체 생성 
2. 전달할 데이터 값 넣음
```
    
2. .publisher     
: 데이터를 Subscriver에게 여러 개 제공한다.     
```swift
let arrayPublisher = [1, 3, 5, 7, 9].publisher   

1. 전달할 배열 뒤에 .publisher 붙여줌
2. 여러 개의 데이터 전달 가능 
```
     
여러 가지 빌트인 Subscriber     
1. sink     
: Publisher 뒤에 사용하는 메서드로 Publisher가 제공하는 데이터를 받을 수 있는 클로저를 제공한다.     
```swift
let subscription1 = just.sink { value in
    print("Received value: \(value)"
}
``` 
      
2. assign     
: Publisher 뒤에 사용하는 메서드로 Publisher가 제공하는 데이터를 특정 객체의 키패스에 할당한다.    
```swift
class MyClass {
    var property: Int = 0 {
    didSet {
    print("Did set to property: \(property)")
}
}
}

let object = MyClass()
let subscription3 = arrayPublisher.assign(to: \.property, on: object)
```


