# Collection View
 위 페이지는 xcode의 component의 "Collection View"에 대해 정리한 페이지입니다.    
       
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
 - 1. CocoaTouch Class에서 CollectionViewCell 파일 생성      
 - 2. Storyboard의 CollectionViewCell과 연결       
      1) Identity inspector -> Custom Class -> Class (현재 CollectionViewCell과 코드파일 연결)     
      2) Attributes inspector -> Collection Reusable View -> Identifier (셀을 재사용하기 위한 재사용 구분자)   
 7. 커스텀 셀 코드파일에 셀의 component 아울렛 변수 생성     
 8. component의 데이터를 업데이트 할 함수 생성      
 
 ### 9. 셀을 이용하여 화면에 데이터를 표현       
 1. DataSource Protocol      
 : 데이터는 무엇이야? 몇 개야? 셀은 어떻게 표현할거야?를 CollectionView에 알려주기 위한 프로토콜 정의     
 1) collectionView.dataSource = self ( 현재 ViewController에서 CollectionView가 따라야할 규칙을 알려줌)     
 Data, Presentation을 위임한다.       
 DataSource는 Data, Presentation을 담당하고 있는데, 담당해줄 사람이 현재 ViewController로 할당해준다.     
 이는, 현재 ViewController가 Data, Presentation을 어떻게 해야하는지 collectionView에게 알려준다는 것이다. 
   
          
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
            
        // 1. 우리가 새로만든 커스텀 셀을 생성.
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "(커스텀셀의 Reusable Identifier)", for: indexPath) as? (커스텀셀 CollectionViewCell) else {
            return UICollectionViewCell()
        }
        // for: indexPath: 재사용할 셀을 가져왔는데, 이게 몇 번째 셀에 해당하는 것 인지 알려줌
        // as: ? 붙여준 이유는 타입 캐스팅을 실패할 수 있어서
        // casting 하는 이유는, 데이터 업데이트 하는 함수를 사용하기 위해서.
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
  
 
 
## UICollectionView 컴포넌트 속성 정리     
```swift
CollectionView
    |_ Size inspector
        |_ Collection View
            |_ Estimate Size: 셀 자체의 사이즈를 설정
                |_ Automatic: 셀 사이즈를 상황에 따라서 자동으로 변경
                |_ None: 셀 사이즈를 CGSize에 제공한 값으로 고정
            
CollectionViewCell
    |_ Identity inspector
        |_ Custom Class
            |_ Class: CollectionViewCell 코드파일을 연결
    |_ Attributes inspector
        |_ Collection Reusable View
            |_ Identifier: 셀을 재사용하기 위해, 재사용 구분자를 사용(Custom Class의 이름과 동일하게 사용)
            : Class의 이름이 고유하기에, Class 이름과 재사용 구분자를 동일하게 쓰는 것이 업계의 관행이다.

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
[참조](https://points.tistory.com/10)      
       
2. SF symbols 이미지 렌더링 안되는 문제     
SF symbols를 보면 각 이미지마다 사용할 수 있는 버전이 있다.     
iOS 16+ 이상의 이미지는 system 이미지로 사용할 수 없어, 런타임시에 이미지가 업데이트 되지 않았다.     
SF symbols 이미지를 사용할 때, 꼭 이미지의 버전을 보거나,
storyboard의 UIImageView에서 system에 이미지를 검색하여 있는지 확인한 후 사용하자.     




