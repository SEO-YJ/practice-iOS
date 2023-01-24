# Collection, Enum
## Collections
- 변수들을 담아 놓은 통      
 
### Array

- 프로그램 데이터들을 `순서`대로 담아놓은 변수      
- 선언 방법      
    - 1. var arrayName: [type] = [value, value, value]     // Type Annotation O
    - 2. var arrayName = [type]([value, value, value])     // Type Annotation X 
- 아이템 접근시 index 이용     
    - 시작: 0, 끝: count - 1     
    - 범위 밖의 index 요청하면 크래시(에러) 발생      

```swift
let yoo = "유재석"
let ji = "지석진"
let ha = "하하"
let so = "전소민"
let song = 30
var kim = "김종국"


var runningMans = [Any]([yoo, ji, ha, so, song, kim]) // 생성자 안에 배열 데이터로 초기화하여도됨.
kim = "박종국" // 변수 kim에 다른 값 할당해도 Array에 영향 X    [유재석, 지석진, 하하, 전소민, 30, 김종국]
runningMans.append("유준") // 변수 Array에 아이템 추가      [유재석, 지석진, 하하, 전소민, 30, 김종국, 유준]
runningMans.remove(at: 5) // 변수 Array에 아이템 제거      [유재석, 지석진, 하하, 전소민, 30, 유준]
runningMans[5] = "not"    // 변수 Array에 아이템 변경      [유재석, 지석진, 하하, 전소민, 30, not]



/*
 Test
 Array의 아이템을 변수, 상수로 할당하여 Array를 선언하는 경우
 
 1. Array를 상수(let)로 선언시, append 메서드, remove 메서드, 아이템 변경 불가
 2. Array를 상수(let)로 선언시, 변수(var)를 아이템으로 할당 가능
    - 변수의 값을 변경해도, Array에 변경된 값 적용안됨.
 3. Array를 변수(var)로 선언시, append 메서드, remove 메서드, 아이템 변경 가능
 4. Array를 변수(var)로 선언시, 변수(var)를 아이템으로 할당 가능
    - 변수의 값을 변경해도, Array에 변경된 값 적용안됨.
 
 Test 결과
 : Array 생성 시, 변수를 아이템으로 할당하여도,
 그 변수의 프로그램 데이터 값만을 Array에 저장하고,
 실제 변수는 Array에 할당한 변수에서 영향을 끼치지 못한다.
 
 결론
 1. Array를 상수로 선언시 -> 아이템 값 변경 불가
 2. Array를 변수로 선언시 -> 아이템 값 변경 가능
 변경 방법
    - 인덱스로 접근하여 값을 할당
    - append 메서드로 값을 추가
    - remove 메서드로 값을 제거
 */

// 비어 있는 배열 초기화
var emptyArr1: [Int] = [] // Type Annotation으로 빈 Array 선언
var emptyArr2 = [Int]()  // Type Annotation이 없으므로 뒤에 타입 명시
```


### Dictionary

- 프로그램 데이터들을 `키`와 `값`으로 담아놓은 변수     
- 값에 접근시 키 사용
    - 접근한 키의 값이 없으면 `nil` 반환
    - 접근한 키의 값이 있으면 `해당 값` 반환

```swift
let engDic: [String: String] = [
    "dog" : "개",
    "cat" : "고양이",
    "pig" : "돼지"
]

let dog = engDic["dog"] // "개" 반환
let cat = engDic["cat"] // "고양이" 반환
let bear = engDic["bear"] // nil 반환

// 비어 있는 딕셔너리 초기화
var emptyDic1: [String: Any] = [:]
var emptyDic2 = [String: Any]()
```

### Set

- 프로그램 데이터들을 `순서 없이`, `중복 없이` 담아놓은 변수      
- Array와 Set의 차이점
    - Array    
        - 1. 순서가 있다. (index)      
        - 2. 중복된 값을 들고 있다. (별개)     
    - Set     
        - 1. 순서가 없다. (랜덤 순서다)       
        - 2. 중복된 값을 들고 있지 않다.        

```swift
var primes: Set<Int> = [1, 2, 3, 3] // Type Annotation이 없으면 Array로 추론됨.
                                    // var primes = [1, 2, 3, 4]

// 중복 데이터 무시
var evens = Set<Int>([2, 4, 6, 8, 8, 8]) // 4, 2, 8, 6


// 비어 있는 셋 초기화
var emptySet1: Set<Int> = []    // Type Annotation으로 빈 Set 선언 
var emptySet2 = Set<Int>()      // Type Annotation 없이 빈 Set 선언
```


### Tuple

- 프로그램 데이터들을 `하나의 데이터`로 표현      
- 접근 방법      
    - 1. 포지션     
    - 2. 이름      
    

```swift
var earPhone = (brand: "galaxy", name: "buds1")
var myEarPhoneName = earPhone.self
print(myEarPhoneName.self)
print(myEarPhoneName.brand) // 이름 접근        "galaxy"
print(myEarPhoneName.name)  // 이름 접근        "buds1"
print(myEarPhoneName.0)     // 포지션 접근       "galaxy"
print(myEarPhoneName.1)     // 포지션 접근       "buds1"
// print(myEarPhoneName.2)  // 없는 포지션 접근시 에러 발생
                            // Value of tuple type '(brand: String, name: String)' has no member '2'
 
var rawEarPhone = ("apple", "Air pod")  // 이름 없이 tuple 생성
rawEarPhone.0   // 포지션으로만 접근 가능
rawEarPhone.1   // 포지션으로만 접근 가능
// 이름으로 접근 불가
```

### enum

- 서로 관계있는 값들을 모은 타입               
- 특징        
    - 1. 함수의 전달인자로 전달시, enum은 선택지가 정해져 있어 안전함.       
    - 2. 연관된 값들을 표현할 경우, enum이 편함.

```swift
// 월을 enum으로 표현
// 특정 타입(월)에 관해 연관되어 있는 값들 (1월,2월,3월...) 모은 타입
enum Month {
    case jan
    case feb
    case mar
    case ari
    case may
    case jun
    case jul
    case aug
    case sep
    case oct
    case nov
    case dec
}

var thisMonth: Month = .dec     // Type Annotation 적용


//MARK: 연관값(associated value)을 가지고 있는 형태 
// 기존의 미디어 타입 + 파일 확장자도 문자열로 받을수 있게 수정
enum Media {
    case video(String)
    case audio(String)
}

var mp3 = Media.audio("mp3")      // Type Annotation 적용 X
var h264 = Media.video("h264")


//MARK: Enum에 value를 할당해서 표시할 경우
// 기본 value의 타입을 표시

// 1. Int 형을 이용해 enum의 case의 value값을 할당하는 방법
// Int 타입의 경우, 맨 위 케이스 부터 0으로 시작
enum EngClass: Int {
    case grammarClass
    case interchangeClass
    case professionalClass
}

var myEngClass: EngClass = .professionalClass
myEngClass.rawValue // Ex> 서버와 통신할 때, case 값을 숫자로 저장하고 싶을 경우 사용

let yourEngClass = EngClass(rawValue: 1)    // Ex> 서버에서 case 분류가 숫자로 되어있을 경우
                                            // 실제로 프로그램 돌릴 때는, 숫자 -> case로 사용할 경우
// let noneEngClass = EngClass(rawValue: 5)    // 해당하는 case가 없으므로 nil 반환


// 2. String형을 이용해 enum의 case에 value값을 할당하는 방법
// String의 경우, 1) case 이름 그대로, 2) 새로 지정
// EnumType(rawValue: ) 접근시
// - 1. case 이름으로 접근 가능
// - 2. 새로 지정한 String으로 접근 가능
// EnumType.case.rawValue 접근시
// - 1. 새로 지정한 String 없는 경우 -> case 값이 String으로 반환
// - 2. 새로 지정한 String 있는 경우 -> 새로 지정한 String이 반환

enum MathClass: String {
    case basicClass
    case middleClass
    case highClass = "high"
}

var myMathClass = MathClass(rawValue: "basicClass") // case 이름으로 접근
var anotherMathClass = MathClass(rawValue: "high")  // enum 타입의 case에 할당한 value로 접근하면 case 할당


// Ex> 서버에서 enum의 rawValue값을 String으로 저장하는 경우
enum Direction: String {
    case up
    case down
    case leftRight = "left_right"   // Ex> Swift: Camel Case, Server: Underscore
}

var dir: Direction = .up
var serverData = dir.rawValue
```

