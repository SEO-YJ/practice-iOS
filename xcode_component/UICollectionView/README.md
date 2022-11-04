# UICollectionView
 위 페이지는 xcode의 component의 "UICollectionView"에 대해 정리한 페이지입니다.    
       
 ## 리스트와 그리드
 iOS 개발자가 가장 많이 구현하는 것이 리스트와 그리드이다.    
 리스트와 그리드를 구현하기 위해서 UIKit에서는 'UITableView'와 'UICollectionView'를 제공한다.      
 UITableView는 **'여러 데이터를 싱글 컬럼으로 나열해서 표현하는 뷰'** 이고,    
 UICollectionView는 **'여러 데이터를 여러 컬럼 또는 레이아웃을 커스터마이징해서 표현하는 뷰'** 이다.      
 
 ### 리스트뷰
 컨텐츠를 1열의 리스트로 보여준다.    
 * 특징    
 1. 주로 텍스트로 이루어져 있다.    
 2. 텍스트 옆에 아이콘, 썸네일 등을 배치한다.     
 3. 사용자는 텍스트를 읽고 찾고 있는 정보를 선택한다.     
 
 * 장점     
 1. 페이지를 짧게 만들어 그리드뷰에 비해 상대적으로 적은 스크롤을 할 수 있게 한다.      
 2. 이미지가 없어, 한 화면에 더 많은 선택지를 제공할 수 있다.     
 3. 사람은 이미지를 보고 찾고 있는 정보가 아닌, 다른 선택지를 찾는 경우가 있는데 리스트뷰는 텍스트를 통해 사용자가 찾는 정보를 선택할 수 있게 한다.     
       
 ### 그리드뷰   
 이미지를 2개 이상의 열로 보여준다.     
 * 특징     
 1. 이미지가 화면의 대부분을 차지한다.      
 2. 텍스트는 짧게 적용되어 있다.      
 3. 사용자는 이미지를 보고 찾고 있는 정보를 선택한다.      
       
 * 장점
 1. 이미지를 보고 세부적인 정보를 확인할 때 좋다.     
 
 
 ## Collection View 사용시 고려사항     
 1. Data     
 어떠한 데이터를 사용할지 고려해야 한다.      
 
 2. Presentation      
 셀들을 어떻게 표현할지 고려해야 한다.     
 셀: 하나의 정보를 담고있는 단위    
 
 3. Layout     
 셀들의 레이아웃을 어떻게 할지 고려해야 한다.    
 레이아웃: 각 구성요소를 제한된 공간 안에서 효과적으로 배열, 배치     
 iOS로 생각해보면, 각 Component를 UICollectionView 내에서 어떻게 효과적으로 배치할지 생각     
 
 ## Collection View 사용 과정
 1. DataModel 파일 생성      
 - Struct로 사용자 타입 생성     
 - extension 사용하여 컬렉션 타입으로 데이터 할당     
 - extension 의 컬렉션 타입은 static 변수 사용      
         
 2. storyboard의 ViewController와 연결할 코드 파일 생성 후 연결      
 3. storyboard에 UICollectionView 넣고 AutoLayout 잡기      
 4. UICollectionView의 아울렛 변수 생성     
 5. CollectionViewCell에 컴포넌트 넣고 AutoLayout 잡기      
 - 1. Content View와 component의 AutoLayout      
 - 2. component끼리의 AutoLayout      
 - 3. Image View, Button 과 같이 크기가 정해지지 않은 것은, 크기도 정해주어야 한다.      
 6. 커스텀 셀에 대해 표현할 코드파일 생성      
 : 데이터를 받아서 컴포넌트를 업데이트 해야 하기에 이 코드파일을 생성    
       
 - 1. CocoaTouch Class에서 CollectionViewCell 파일 생성      
 - 2. Storyboard의 CollectionViewCell과 연결       
      1) Identity inspector -> Custom Class -> Class (현재 CollectionViewCell과 코드파일 연결)     
      2) Attributes inspector -> Collection Reusable View -> Identifier (셀을 재사용하기 위한 재사용 구분자)   
 7. 커스텀 셀 코드파일에 셀의 component 아울렛 변수 생성     
 8. component의 데이터를 업데이트 할 함수 생성      
 
 ### 9. 셀을 이용하여 화면에 데이터를 표현       
 프로토콜: 해야 할 일 들을 정해놓은 약속      
 준수(Conforming): 해야 하는 것을 실제로 구현하는 것, 필요한 method, property를 구현한다.            
        
 1. DataSource Protocol      
 : 데이터는 무엇이야? 몇 개야? 셀은 어떻게 표현할거야?를 CollectionView에 알려주기 위한 프로토콜 정의     
 
 1) collectionView.dataSource = self 
 : collectionView가 self에게 물어보는 것이다.    
   self(현재 ViewController)에서 CollectionView가 따라야할 규칙을 알려준다.     
        
 Data, Presentation을 위임한다.       
        
 DataSource는 Data, Presentation을 담당하고 있는데, 담당해줄 사람이 현재 ViewController로 할당해준다.     
 이는, 현재 ViewController가 Data, Presentation을 어떻게 해야하는지 collectionView에게 알려준다는 것이다. 
 따라서, 위임받는 객체는 위 프로토콜을 준수(Conforming)해야 한다.     
       
 규칙을 알려주기 위해 규칙을 정해야 한다.     
 extension을 사용한다.      
 extension으로 self(현재 ViewController)를 확장하여 규칙을 구현한다.      
 규칙을 구현하기 위해서는 확장한 프로토콜을 준수(Conforming) 해야 하는데,      
 필수적으로 구현해야하는 method, property를 구현해줘야 한다.     
          
 2) DataSource Protocol 정의 (extension ... : UICollectionViewDataSource)      
 - 1. Data: 어떠한 데이터를 사용할 것 인가?      
           1) Data 저장: DataModel 파일       
           2) Data 갯수: DataSource 메소드-> numberOfItemsInsection에서 return list.count     
 - 2. Presentation: 셀을 어떻게 표현할 것인가?      
           1) Cell 데이터 업데이트: CollectionViewCell 파일에서 컴포넌트의 데이터를 아울렛 변수에 할당하는 함수 생성 후, cellForItemAt 메소드에서 호출      
           2) Cell 반환: DataSource 메소드-> cellForItemAt에서 재사용할 셀 생성 후 데이터 업데이트 후에 셀 반환     
           
```swift
extension (현재 ViewController): UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        /*
        Data 갯수: 
        컬렉션 뷰에게 몇 개의 셀이 필요하냐?
        하나의 섹션 안에 몇개의 아이템을 사용할거야?
        */
        return (DataModel에 할당한 리스트).count // 데이터의 갯수 만큼 사용할거야~
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        /*
        Presentation: 각 셀을 어떻게 표현할거냐?
        */
        // cellForItemAt indexPath: IndexPath  몇 번째에 해당하는 셀을 표현할지 결정
            
        // 우리가 새로 만든 커스텀 셀을 생성.
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "(커스텀셀의 Reusable Identifier)", for: indexPath) as? (커스텀셀 CollectionViewCell) else {
            return UICollectionViewCell()
        }
        
        // dequeReusableCell: 컬렉션뷰에서 셀을 재사용
        // withReuseIdentifier: 재사용 구분자를 이용해 재사용할 셀을 가져온다.
        // indexPath: 재사용할 셀을 가져왔는데, 이게 몇 번째 셀에 해당하는 것 인지 알려줌 (순서)
        // as: 옵셔널 (?)을 붙여준 이유는 타입 캐스팅을 실패할 수 있어서
        // casting 하는 이유는, 데이터 업데이트 하는 함수를 사용하기 위해서. (커스텀 셀 코드파일에 정의됨)
        // guard ... else : 타입 캐스팅을 실패할 수 있어, 옵셔널 타입이므로, 옵셔널 바인딩을 진행한다.
        // (커스텀셀 CollectionViewCell)로 타입 캐스팅 되면 아래 코드르 실행하고, 실패하면 UICollectionViewCell을 반환한다. 
        
        /*
         guard < 꼭 참이어야 하는 조건> else {
         return ...
         }
         // 참일 경우 아래 코드 실행
         ...
         */
        
        /*
         as?
         : casting
         Bruno: 남자 사람
         남자: 사람 (상속받음)
         
         let joon = Namja() // 남자 이면서 사람
         let joon = Saram() // 사람인 건 아나 남자인지 궁금
         
         joon as? Namja
         
         guard let nam = joon as? Namja else {
         return
         }
         print 남자입니다
         */
        
        
        1) Cell 데이터 업데이트
        // 2. 커스텀 셀에 해당하는 데이터를 준다.
        let stock = stockList[indexPath.item]
        // indexPath
        // 1. 섹션에 대한 정보, 2. 섹션 안의 Row에 대한 정보
        // indexPath.item
        // 1. indexPath의 요소
        
        // 3. 커스텀 셀의 데이터를 업데이트 한다.
        cell.configure(stock)
        
        2) Cell 반환
        return cell
    }
}
```           

 2. DelegateFlowLayout Protocol     
 : 셀의 크기를 어떻게 하여 컬렉션뷰의 레이아웃을 정할거야?             
  1) collectionView.delegate = self ( 현재 ViewController에서 CollectionView가 따라야할 규칙을 알려줌)     
 Layout을 위임한다.       
 Delegate는 Layout을 담당하고 있는데, 담당해줄 사람이 현재 ViewController로 할당해준다.     
 이는, 현재 ViewController가 Layout을 어떻게 해야하는지 collectionView에게 알려준다는 것이다.  
         
  2) Delegate Protocol 정의 (extension ... : UICollectionViewDelegateFlowLayout)      
 - 1. Layout: 셀을 어떻게 배치할 것 인가?       
           1) Layout 배치: DelegateFlowLayout 메소드-> sizeForItemAt에서 CGSize메소드에 각 셀의 높이, 너비 값을 할당하여 반환     
           (셀 하나의 사이즈를 정해준다.)
```swift
 extension (현재 ViewController): UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        1) Layout 배치
        return CGSize(width: collectionView.bounds.width, height: 80)
        // collectionView.bounds.width: 컬렉션 뷰의 너비
    }
}
```

## Collection View 사용 과정 - Grid 만들기
1. UICollectionViewDelegateFlowLayout을 이용해 구현     
2. 행에 있는 각 셀들의 여백을 상수로 할당     
3. content의 padding 있을 시 (viewDidLoad의 contentInset 설정) 상수로 할당     
4. 셀 하나의 높이, 너비 값 할당      
5. CGSize에 셀의 높이, 너비 값 넣어 반환      
6. 셀 들 간의 수평, 수직 공백을 명시적으로 넣어주고 싶을 경우      
    수평 공백: minimumInteritemSpacingForSectionAt       
    수직 공백: minimumLineSpacingForSectionAt       


```swift
extension FrameworkListViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        // 그리드뷰 만드는 법
        
        // 행 위에 있는 각 셀들의 여백을 상수로 할당한다.
        let interItemSpacing: CGFloat = 10
        let padding: CGFloat = 16
        
        // 셀 하나의 너비값을 할당한다.
        // collectionView.bounds.width - 여백X여백 갯수 / 셀 갯수
        let width = (collectionView.bounds.width - interItemSpacing * 2 - padding * 2) / 3
        
        // 셀 하나의 높이값을 할당한다.
        let height = width * 1.5
        
        // 셀의 하나의 너비, 높이 값을 반환한다.
        return CGSize(width: width, height: height)
    }
    
    // Cell들간의 수평 공백, 수직 공백을 명시적으로 정하는 방법
    
    // cell 들 간의 수평 공백을 명시적으로 정해주는 함수
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
    
    // cell 들 간의 수직 공백을 명시적으로 정해주는 함수
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
}
```    
 
## UICollectionView 컴포넌트 속성 정리     
```swift
CollectionView
    |_ Size inspector
        |_ Collection View
            |_ Estimate Size: 자동으로 시스템 계산하는 것을 요청하는 것
                |_ Automatic: 셀 사이즈를 상황에 따라서 자동으로 변경, 시스템이 임의로 사이즈를 계산
                |_ None: 셀 사이즈를 CGSize에 제공한 값으로 고정.  
                        개발자가 의도한 대로 Collection View의 사이즈를 잡기 위해서는, 
                        EstimatedItemSize의 값이 none이 되어야 한다.    
                        * 속성과 같은 경우는 개발자들이 코드로 확인하는 것이 용이하기에, 코드로 작성하는 것이 좋다.     
                |_ Min Spacing
                    |_ For Cells: Cell 간의 간격
                    |_ For Lines: 줄 간의 간격
                                * 명시적으로 메소드를 생성하지 않으면, storyboard에 지정된 상수값으로 간격을 반환한다.
            
CollectionViewCell
    |_ Identity inspector
        |_ Custom Class
            |_ Class: CollectionViewCell 코드파일을 연결
    |_ Attributes inspector
        |_ Collection Reusable View
            |_ Identifier: 셀을 재사용하기 위해, 재사용 구분자를 사용(Custom Class의 이름과 동일하게 사용)
            : Class의 이름이 고유하기에, Class 이름과 재사용 구분자를 동일하게 쓰는 것이 업계의 관행이다.

```

## CollectionView 구현시 도움되는 기술 리스트
### Collection View 셀 클릭 시 반응 확인   

```swift

// 셀 클릭 시 반응 확인    
// 현재 View Controller의 Delegate 프로토콜을 확장하여 사용  
// Delegate 부분에서 클릭 관련 내용도 위임한다.      

extension FrameworkListViewController: UICollectionViewDelegate {
    // 셀을 선택했을때 호출되는 메소드
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        // 컬렉션 뷰의 셀 선택시에 셀의 이름을 출력해보자.
        let framework = list[indexPath.item]
        print(framework.name)
    }
}
```

### Collection View를 화면에 더 많이 제공하는 방법
: SuperView에 AutoLayout을 걸어준다.       
Top: 1. 네비게이션 부분 Blur 처리 2. 노치 부분까지 Contents를 확인 가능       
Bottom: 1. 화면 최하단 까지 contents 표시 가능        
      
### Collection View의 셀이 재사용 되기 전에 준비하는 메소드
```swift
커스텀셀 파일에 선언
override func prepareForReuse() {
        super.prepareForReuse()
        // 기존의 이미지 Reset
        // 셀 재사용시 이미지뷰에 할당되어있는 이미지를 초기화
        imageIconImageView.image = nil
}
```


## CollectionView 구현시 도움되는 문법 리스트
### 조건에 따라 Label의 text 색상 변경
```swift
// 삼항연산자 사용
// 커스텀셀 코드 -> 데이터 업데이트 함수에서 사용

diffLabel.textColor = stock.diff > 0 ? UIColor.systemRed : UIColor.systemBlue
```

### 돈 표현 (천 단위마다 , 추가)
```swift
// 커스텀셀 코드 -> 새로운 함수 구현
// numberformatter 객체의 numberStyle을 .decimal 을 할당시 천 단위 마다 , 표시 가능
// numberformatter 객체의 maximumFractionDigits로 소숫점 표시 자릿 수 설정 가능


    func convertToCurrencyFormat(price: Int) -> String {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal // 천 단위 마다 , 표시
        numberFormatter.maximumFractionDigits = 0 // 소수점 표현 가능 자릿수: 0
        let result = numberFormatter.string(from: NSNumber(value: price)) ?? ""
        // numberformatter로 처리된 값은 옵셔널 처리되므로 ??로 옵셔널 바인딩
        return result
    }
```
[NumberFormatter 참고링크](https://jinsangjin.tistory.com/104)

### 배열의 멤버를 내림차순으로 정렬하는 방법
```swift
// 데이터모델의 리스트의 아이템들을 내림차순으로 정렬하려면 ViewController의 viewDidLoad 함수에서 아래 코드를 구현
// 클로저 사용

chatList = chatList.sorted(by: { chat1, chat2 in
return chat1.date > chat2.date
})
```

### ImageView의 꼭짓점 부분을 뭉뚝하게 만드는 방법
```swift
// 커스텀셀의 코드파일에서 awakeFromNib 함수 override
// awakeFromNib: Storyboard에서 Cell을 꺼내올 때 처음 호출 되는 함수
// imageView의 layer의 cornerRadius에 값을 조절하여 뭉뚝하게 변경가능

override func awakeFromNib() {
    super.awakeFromNib()
    // 셀의 이미지 꼭짓점을 뭉뚝하게 만들어주는 함수를 구현해보자.
    thumbnail.layer.cornerRadius = 10
}
```
### 날짜를 원하는 Format으로 변환하고자 할 때
```swift
// 컬렉션뷰의 데이터 중에 날짜의 format을 변경하고 싶을 경우
// 커스텀셀의 코드파일에 Date 변경 함수 구현
// 함수 내부에 dateFormat 이용하여 날짜 형식 변경 

func formattedDateString(dateString: String) -> String {
        /*
        String -> Date -> String
        ios Date Formatter 이용
        년-월-일 -> 월-일
        ex> 2022-04-01 -> 4/1
        */
    let formatter = DateFormatter()
    formatter.dateFormat = "yyyy-MM-dd"
        
        /*
        문자열을 Date 타입으로
        Date 타입을 가지고 있으면, 어떠한 Date 형태로도 변환할 수 있다.
        */
    if let date = formatter.date(from: dateString) {
        formatter.dateFormat = "M/d"
        return formatter.string(from: date)
    } else {
        return ""
    }
}
```
[DateFormatter 참고링크](https://formestory.tistory.com/6)

### 네비게이션 컨트롤러의 네비게이션 아이템 title text 작성 방법
```swift
// 현재 ViewController에 Navigation Controller를 Embed in 했으므로, viedDidLoad 함수에 작성

navigationController?.navigationBar.topItem?.title = "☀️ Apple Frameworks"

```

### 컬렉션 뷰의 Estimate Size 코드로 설정 방법
```swift
// 현재 ViewController에 컬렉션 뷰의 Estimate Size를 설정하는 것이므로, viewDidLoad 함수에 설정
// 아울렛 변수로 연결한 collectionView의 collectionViewLayout을 사용
// storyboard에서는 변경 사항들을 확인하기 어려우니, 변경 사항을 수정할 경우에 코드로 작성해 놓는 것이 용이하다.     

if let flowlayout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout {
    flowlayout.estimatedItemSize = .zero
}

```

### 컬렉션 뷰 컨텐츠의 padding 설정 방법
```swift
// 현재 ViewController에 컬렉션 뷰의 컨텐트의 padding을 설정하는 것이므로, viewDidLoad 함수에 설정
// 아울렛 변수로 연결한 collectionView의 contentInset을 사용

collectionView.contentInset = UIEdgeInsets(top: 20, left: 16, bottom: 0, right: 16) 
// 아울렛변수.contentInset = UIEdgeInsets(top: 공백값, left: 공백값, bottom: 공백값, right: 공백값)
// 주의: 이 값 사용시, Layout 부분의 높이, 너비부분을 계산한 값도 변경해주어야 한다.      
```

### Label의 text를 안 짤리게 하는 방법
```swift
// 커스텀셀의 코드파일에서 awakeFromNib 함수 override
// awakeFromNib: Storyboard에서 Cell을 꺼내올 때 처음 호출 되는 함수

override func awakeFromNib() {
    super.awakeFromNib()
    nameLabel.numberOfLines = 1 // Label의 text를 줄 1개로 표시
    nameLabel.adjustsFontSizeToFitWidth = true // Label의 너비에 따라 폰트 사이즈를 조절
}
```     
      
### DataModel 파일 생성하지 않고, Assets의 Image 만을 가지고 CollectionView 생성 방법     
```swift
func ... numberOfItemsInsection ... {
return 이미지갯수
}

func ... cellForItemAt ... {
...
let imageName = "...\(indexPath.item+1)"
// indexPath.item은 0부터 아이템의 갯수까지 1씩 증가
}
```


## Collection View 구현시 에러 리스트
1. Unknown class _ViewController in Interface Builder file.     
Run 시에 UICollectionViewCell 파일을 찾지 못해 런타임에러가 발생하였다.    
해결방법      
: CollectionViewCell -> Identity inspector를 확인하자.      
Identity inspector -> Custom Class를 보면,      
Class, Module이 있는데      
Class: 코드파일 이름     
Module: 현재 프로젝트 파일 이름      
위와 같은 형식으로 되어있어야 한다.      
에러가 발생한 이유는 Module 부분이 'none'으로 되어있어서 런타임시에 파일을 찾지 못해 에러가 발생하였다.       
[참조링크](https://points.tistory.com/10)      
       
2. SF symbols 이미지 렌더링 안되는 문제     
SF symbols를 보면 각 이미지마다 사용할 수 있는 버전이 있다.     
iOS 16+ 이상의 이미지는 system 이미지로 사용할 수 없어, 런타임시에 이미지가 업데이트 되지 않았다.     
SF symbols 이미지를 사용할 때, 꼭 이미지의 버전을 보거나,
storyboard의 UIImageView에서 system에 이미지를 검색하여 있는지 확인한 후 사용하자.     

3. Collection View Cell에 AutoLayout 잡을 시 주의 사항      
Collection View Cell 내부의 component들을 AutoLayout 잡을 때, top, bottom 둘 다 AutoLayout을 잡고,      
component의 height 역시 값을 할당하여 AutoLayout을 잡아주면,      
반환된 Cell Size의 height에 맞게, AutoLayout의 값이 변경될 수 있다.     
* xCode가 생각하는 우선 순위
1. Collection View Cell의 반환된 크기      
2. AutoLayout: Top, Bottom, Aspect Ratio       
3. Height     
테스트 결과 component의 height값이 변경됨을 확인하였다.      
따라서, **Content View의 bottom의 AutoLayout을 잡지 말고 나머지 AutoLayout을 잡자!**      



