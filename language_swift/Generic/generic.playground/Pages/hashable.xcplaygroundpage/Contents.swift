//: [Previous](@previous)

//MARK: 해시 테이블(Hash Table)

// Hash Table
// Value의 타입은 String
// 빈 3개의 슬롯 생성
// repeating: 모든 값을 초기화

var hashTable: [String?] = .init(repeating: nil, count: 3)
print(hashTable)

func hash(key: Int) -> Int {
    return key % 3
}

func updateValue(_ value: String, forKey key: String) {
    guard let key = UnicodeScalar(key)?.value else { return }
    let hashAddress = hash(key: Int(key))
    hashTable[hashAddress] = value
}

func getValue(forKey key: String) -> String? {
    guard let key = UnicodeScalar(key)?.value else { return nil }
    let hashAddress = hash(key: Int(key))
    return hashTable[hashAddress]
}

updateValue("재석", forKey: "유")
updateValue("명수", forKey: "박")
updateValue("유준", forKey: "서")
print(hashTable)

getValue(forKey: "유")
getValue(forKey: "박")
getValue(forKey: "서")

/*
 updateValue 함수
 1. 매개변수의 key값이 String으로 받음.
 2. 우리는 hash함수를 통해 해시 주소값을 얻어 hash table에 값을 저장하거나 접근할거임.
 3. 일단 key값이 String일 경우에는 이를 Int값으로 바꾼 후에 hash함수에 전달하여 해시 주소값을 만들어야함.
 4. UnicodeScalar라는 것으로 String 값을 숫자로 바꾼 후에 hash 함수로 해시 주소값을 만들어 해시테이블에 값을 저장.
 */

//MARK: Hashable
let myDict: [String: Int] = ["yujun": 24]
/*
 key 값으로 String 타입을 사용해도 문제 X
 왜냐, 컴파일러가 기본 타입은 Hashable 프로토콜을 자동으로 채택해주어서...?
 
 */

struct Human {
    let name: String
    let age: Int
}

// let humanDict: [Human: Int] = [Human(name: "yujun", age: 24): 24]
// Type 'Human' does not conform to protocol 'Hashable'
/*
 구조체로 타입을 선언하여, 딕셔너리의 key 타입으로 사용하였더니
 Human 타입이 Hashable 프로토콜을 채택하지 않아서 에러가 발생함.
 이유
 : Human 타입은 어떠한 값으로 해시하여야 할 지 몰라서 에러가 발생한다.
 */



//: [Next](@next)
//: [Next](@next)
