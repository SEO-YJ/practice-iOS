import UIKit
/*
열거형 (Enumeration)
정의
: 연관된 항목들을 열거해 놓았다.
 
특징
 1. 이름이 대문자로 시작
 2. 타입의 일종
 3. 사용자의 필요에 의해 생성하는 타입
 4. Hashable 함

기능
 1. 제한된 선택지 제공
 2. 인자로 정해진 값 외에는 받고 싶지 않을 경우

*/

//MARK: 활용1: DIffable DataSource의 Section들을 구분할 경우 사용
/*
 
 */
enum Section {
    case first, second, third
}

/*
아래 함수와 같이 Section이라는 타입으로 section 매개변수의 타입을 제한
Section에 사용자가 정의한 선택지 외에는 section 매개변수의 인자로 전달 불가
효과: 잘못된 입력값 배제
 */
func chooseSection(section: Section) {
    print("\(section)을 골랐군요!")
}

/*
section에 전달하는 인자는 Section 타입 분명
타입 이름 생략 후 뒤에 case 이름만 적어줘도 컴파일러는 이해.(타입추론)
+ 초보자의 경우 타입추론 사용을 지양하도록 권고
+ 타입추론을 사용하면 컴파일러도 타입을 추론해야하여 컴파일 시간도 증가
 */
chooseSection(section: Section.first) // Section.first을 골랐군요!
chooseSection(section: .second) // 위와 같은 표현입니다

struct DataModel: Hashable {
    let name: String
    let num: Int
}

extension DataModel {
    static let list = [DataModel(name: "hi", num: 1), DataModel(name: "hi", num: 1), DataModel(name: "hi", num: 1), DataModel(name: "hi", num: 1) ]
}

typealias Item = DataModel
let dataList = DataModel.list

var dataSource: UICollectionViewDiffableDataSource<Section, Item>!
dataSource = nil

var snapshot = NSDiffableDataSourceSnapshot<Section, Item>()
// appendSections 메소드에서는 Section 1개밖에 들어가지 않는데, 다른 Section 선택하려면 어떻게 해야할까?
snapshot.appendSections([Section.first])


print(snapshot.numberOfSections)
print(snapshot.numberOfItems)


/*
팁1: 각 케이스는 한 줄에 개별로도, 한 줄에 여러개도 정의할 수 있습니다.
*/

enum SecondSection {
    case main
    case sub
    case branch
}

enum ThirdSection {
    case main, sub
    case branch
}

/*
팁2: case에 고유한 값 지정하길 원하면 원시값 사용
각 case의 원시값이 될 타입은 열거형 이름의 뒤에 (:)를 붙이고 한 칸 띈 다음 타입 이름을 적어주면 됩니다.
*/

enum Brand: String {
    case apple = "애플", netflix = "넷플릭스"
    case samsung = "삼성", hyundai = "현대"
}

func selectBrand(brand: Brand) {
    print("회사명: \(brand.rawValue)")
}

selectBrand(brand: .samsung)

