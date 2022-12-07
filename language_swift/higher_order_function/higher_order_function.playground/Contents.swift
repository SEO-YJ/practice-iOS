/*
 고차 함수
 1. 함수를 전달 인자로 전달 받음
 2. 함수 실행의 결과를 함수로 반환
 */

//MARK: map
// 컨테이너 내부의 기존 데이터를 변형(transform)하여 새로운 컨테이너를 생성
// 컨테이너 종류
// Array, Dictionary, Set
let numbers: [Int] = [0, 1, 2, 3, 4]
var doubledNumbers: [Int]
var strings: [String]

/*
 //1. 빈 배열 생성
doubledNumbers = [Int]()
strings = [String]()

 //2. 반복문을 구성하여 배열에 할당
for number in numbers {
    doubledNumbers.append(number*2)
    strings.append("\(number)")
}

print(doubledNumbers)
print(strings)
*/

doubledNumbers = numbers.map({ (number: Int) -> Int in
    return number * 2
})

strings = numbers.map({ (number: Int) -> String in
    return "\(number)"
})

print(doubledNumbers)
print(strings)

// 연습
var tripleNumbers: [Int]
/*
tripleNumbers = numbers.map({ (value: Int) -> Int in
    return value * 3
})
*/
// 1. 후행 클로저
tripleNumbers = numbers.map() { (value: Int) -> Int in
    return value * 3
}

// 2. 후행 클로저 + 반환타입 생략
tripleNumbers = numbers.map() { (value: Int) in
    return value * 3
}

// 3. 후행 클로저 + 반환타입 생략 + 단축 인자 이름
tripleNumbers = numbers.map() {
    return $0 * 3
}
 
// 4. 후행 클로저 + 반환타입 생략 + 단축 인자 이름 + 암시적 반환 표현
tripleNumbers = numbers.map() { $0 * 4 }
 
print(tripleNumbers)


//MARK: filter
// 컨테이너 내부의 값을 걸러서 새로운 컨테이너 추출
// for 구문 사용
/*
var filtered: [Int] = [Int]()

for number in numbers {
    if number % 2 == 0 {
        filtered.append(number)
    }
}
*/
var evenNumbers: [Int] = numbers.filter({ (value: Int) -> Bool in
    return value % 2 == 0
})

// 1. 후행 클로저
evenNumbers = numbers.filter() { (value: Int) -> Bool in
    return value % 2 == 0
}

// 2. 후행 클로저 + 반환타입 생략
evenNumbers = numbers.filter() { (value: Int) in
    return value % 2 == 0
}

// 3. 후행 클로저 + 반환타입 생략 + 단축 인자 이름
evenNumbers = numbers.filter() {
    return $0 % 2 == 0
}

// 4. 후행 클로저 + 반환타입 생략 + 단축 인자 이름 + 암시적 반환 표현
evenNumbers = numbers.filter() { $0 % 2 == 0 }

print(evenNumbers)
 
//MARK: reduce
//컨테이너 내부의 컨텐츠를 하나로 통합
let someNumbers: [Int] = [2, 8, 15]

//MARK: for 구문 사용 - reduce
var result: Int = 0

for number in someNumbers {
    result += number
}

print(result)

//MARK: reduce 메서드 사용
// reduce 메서드의 인자로 1. 초깃값, 2. 클로저 전달
var sum: Int = someNumbers.reduce(10) { (first: Int, second: Int) -> Int in
    return first + second // 로직
}

print(sum)

var substract: Int = someNumbers.reduce(0) { (first: Int, second: Int) -> Int in
    return first * second // 로직
}

// 1. 후행클로저 + 반환 타입 생략
substract = someNumbers.reduce(0) { (first: Int, second: Int) in
    return first + second
}

// 2. 후행클로저 + 반환 타입 생략 + 단축 인자 이름
substract = someNumbers.reduce(0) {
    return $0 + $1
}

// 3. 후행클로저 + 반환 타입 생략 + 단축 인자 이름 + 암시적 반환 표현
substract = someNumbers.reduce(0) {
    print("\($0)+\($1)")
    return $0 + $1
}
print(substract)
