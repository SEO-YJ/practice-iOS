# Array, Dictionary, Set
## Collections
- 변수들을 담아 놓은 통      
 
### Array

- 프로그램 데이터들을 `순서`대로 담아놓은 변수      
- 선언 방법      
    - 1. var arrayName: [type] = [value, value, value]      
    - 2. var arrayName = [type]([value, value, value])      
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

let dog = engDic["dog"]
let cat = engDic["cat"]
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
