# Swift 기본지식

## Variable
- 변수란?     
    - 프로그램 데이터를 저장하는 공간       
- 변수 생성 방법          
    - `var` 키워드로 선언     

## String & Integer
- swift의 변수에는 여러 타입을 저장 가능     
    - 변수에 타입이 한 번 지정 되면, 다른 타입의 프로그램 데이터를 할당할 수 없다.    
- `String` 타입: 문자열을 나타냄     
- `Int` 타입: 정수를 나타냄            

```swift
var name = "yujun seo"
// name = 25 -> String 타입으로 이미 지정되어 Int 타입 할당할 수 없다.

// 큰숫자는 "_" 를 써서 읽기 쉽게 숫자를 표현할수 있음
// "_"(underscore)를 사용하여 코드의 가독성을 높일 수 있음.
var myAccountMoney = 5_000_000_000
var anyBigNumber = 1000200300
```

## Double & Booleans
- `Double` 타입: 소수점 표현     
- `Bool` 타입: 참, 거짓 표현(true, false)      

## String Interpolation
- 변수에 할당된 프로그램 데이터를 문자열로 표현 가능
- 방법: `\(변수)`

```swift
var age = 25
var introduce = "My age is \(age) "
```
     
## Constant
- 상수란?       
    - 상수도 변수와 마찬가지로 프로그램 데이터를 저장하는 공간      
- 상수 생성 방법       
    - `let` 키워드로 선언      
- 변수와 상수 차이점      
    - 변수는 할당된 프로그램 데이터를 변경 가능      
    - 상수는 할당된 프로그램 데이터를 변경 불가

## Type Annotation(명시적 타입)
- 변수 선언시 타입을 같이 명시 가능
- 변수 선언시 타입 없이 명시도 가능
    - 시스템이 타입 추론함 (type inference)

```swift
// 명시적 타입 기입 안함 -> Type Inference(타입추론)
var age = 25

// Type Annotation(명시적 타입)
var age: Int = 25
```
