import UIKit

//MARK: - 01. 변수, 상수
let name = "hi"
let num = 120
print(num.isMultiple(of: 4)) // of 인자의 값의 배수인지 확인해주는 메소드

let randomNum = Int.random(in: 1...300) // in의 범위에 해당하는 값을 랜덤하게 반환하는 메소드
print(randomNum)

//MARK: - 02. bool-array
//Boolean
let isMan = true
let isHuman = false

var isSingle = true
isSingle.toggle() // true -> false, false -> true 로 값을 바꿔주는 프로퍼티
print(isSingle)

//String Interpolation
let difficulty = "쉽다"
let maximumAge = 80

let message = "\(maximumAge) 할머니도 배우는 iOS 개발은 \(difficulty)"
print(message)

//Array, Dictionary
//Array
let ages = [3, 20, 60]
let colors = ["green", "red", "yellow"]

let color = colors[1]

//Dictionary
let languageCode = [
    "한국" : "ko",
    "미국" : "en",
    "일본" : "ja"
]

let code = languageCode["미국"] // 딕셔너리는 key 값으로 value 값을 사용


//Array, Dictionary 초기화
var emptyArr: [Int] = [1, 2]
var emptyDic: [String: Any] = [:]

//MARK: - 03. enum
enum WeekDay {
    case mon
    case tue
    case wed
    case thu
    case fri
}

var today: WeekDay = .mon
//var tod: String = "mom"
// 위 처럼 변수를 선언하여 값을 사용하면 에러를 찾기 어려우나, enum 타입으로 사용자 정의하여
// 사용하면 잘못된 값을 할당시에 시스템에서 에러를 발견했다고 알려준다.

//enum MediaType {
//    case audio
//    case video
//}
//
//var mediaType: MediaType = .audio

//associated value
// ex> 파일 확장자도 문자열로 받을 수 있게 수정
enum MediaType {
    case audio(String)
    case video(String)
}

var mp3: MediaType = .audio("mp3")
var h264: MediaType = .video("h264")

//MARK: - 04. 조건문, 반복문
//조건문
//if-else
let age = 10
if age > 20 {
    print("성인")
} else {
    print("미성년")
}

if age >= 0 && age < 10 {
    print("어린이")
} else if age >= 10 && age < 20 {
    print("10대")
} else if age >= 20 && age < 30 {
    print("20대")
} else if age >= 30 && age < 40 {
    print("30대")
} else {
    print("40대 이상")
}

//switch
enum Weather {
    case sun
    case cloud
    case rain
}

var weather: Weather = .rain

switch weather {
case .sun:
    print("해가 있다")
case .rain:
    print("비가 오네")
case .cloud:
    print("구름 많다")
}

//반복문
for age in ages {
    print("\(age)살 입니다.")
}

for (key, value) in languageCode {
    print("\(key)나라의 언어코드는 \(value)입니다.")
}

//MARK: - 05. 옵셔널
//옵셔널과 딕셔너리
let krCode = languageCode["한국"]
let jpCode = languageCode["일본"]
let deCode = languageCode["독일"]

//MARK: - 06. 함수, 클로저
//함수
func printGugu(dan: Int) {
    for count in 1...9 {
        print("\(dan) * \(count) = \(dan*count)")
    }
}

printGugu(dan: 5)

func rollDice() -> Int {
    return Int.random(in: 1...6)
}

let random = rollDice()
