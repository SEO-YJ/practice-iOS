import UIKit
// Collections: 변수들을 담을 통

//MARK: Array
//특징: 프로그램 데이터를 순서대로 담아놓은 변수

let yoo = "유재석"
let ji = "지석진"
let ha = "하하"
let so = "전소민"
let song = 30
var kim = "김종국"


var runningMans = [Any]([yoo, ji, ha, so, song, kim]) // 생성자 안에 배열 데이터로 초기화하여도됨.
kim = "박종국" // 변수 kim에 다른 값 할당해도 Array에 영향 X
runningMans.append("유준") // 변수 Array에 아이템 추가
runningMans.remove(at: 5) // 변수 Array에 아이템 제거
runningMans[5] = "not"    // 변수 Array에 아이템 변경



/*
 Test
 Array의 아이템을 변수, 상수로 할당하여 Array를 선언하는 경우
 
 1. Array를 상수로 선언시, append 메서드, remove 메서드, 아이템 변경 불가
 2. Array를 상수로 선언시, 변수를 요소로 할당 가능
    - 변수의 값을 변경해도, Array에 변경된 값 적용안됨.
 3. Array를 변수로 선언시, append 메서드, remove 메서드, 아이템 변경 가능
 4. Array를 변수로 선언시, 변수를 요소로 할당 가능
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


runningMans[0] // -> 유재석
runningMans[1] // -> 지석진
runningMans[5] // -> 김종국

// 비어 있는 배열 초기화
var emptyArr1: [Int] = [] // Type Annotation으로 빈 Array 선언
var emptyArr2 = [Int]()  // Type Annotation이 없으므로 뒤에 타입 명시



//MARK: Dictionary
//특징: 프로그램 데이터를 키와 값으로 담아놓은 변수
//1. 값을 접근하기 위해 키를 사용하여 접근

let engDic: [String: String] = [
    "dog" : "개",
    "cat" : "고양이",
    "pig" : "돼지"
]

let dog = engDic["dog"]
let cat = engDic["cat"]
let bear = engDic["bear"]

// 비어 있는 딕셔너리 초기화
var emptyDic1: [String: Any] = [:]
var emptyDic2 = [String: Any]()


//MARK: Set
//특징: 프로그램 데이터를 순서 없이, 중복 없이 담아놓은 변수
//1. <> 제네릭 등장

var primes: Set<Int> = [1, 2, 3, 3] // Type Annotation이 없으면 Array로 추론됨.

// 중복 데이터 무시
var evens = Set<Int>([2, 4, 6, 8, 8, 8])


// 비어 있는 셋 초기화
var emptySet1: Set<Int> = []
var emptySet2 = Set<Int>()


//MARK: Tuple
var earPhone = (brand: "galaxy", name: "buds1")
var myEarPhoneName = earPhone.self
print(myEarPhoneName.self)
print(myEarPhoneName.brand) // 이름 접근
print(myEarPhoneName.name)  // 이름 접근
print(myEarPhoneName.0)     // 포지션 접근
print(myEarPhoneName.1)     // 포지션 접근
// print(myEarPhoneName.2)     // 없는 포지션 접근시 에러 발생
                            // Value of tuple type '(brand: String, name: String)' has no member '2'
 
var rawEarPhone = ("apple", "Air pod")  // 이름 없이 tuple 생성
rawEarPhone.0   // 포지션으로만 접근 가능
rawEarPhone.1   // 포지션으로만 접근 가능


//MARK: Enum
// 한글식 표현 보다 영어 표현 그대로 사용하자.
// 영어 표현으로 찾아야 더욱 다양한 정보들을 구글에서 얻을 수 있다.

// 연관된 값들을 표현할 때 enum 타입이 편하다.

// 월을 한번 enum으로 표현
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

var thisMonth: Month = .dec   // Type Annotation 적용

// Associated Value(연관된 값)
enum Media {
    case video(String)  // case 옆에 Type 명시
    case audio(String)
}

var mps = Media.audio("mp3")    // Type Annotation 적용 X
var h246 = Media.video("h246")


// Enum에 value를 할당해서 표시
// 기본 value의 타입을 표시

// 1. Int 형을 이용해 enum의 case의 value값을 할당하는 방법
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


// 2. String 형을 이용해 enum의 case의 value값을 할당하는 방법
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


