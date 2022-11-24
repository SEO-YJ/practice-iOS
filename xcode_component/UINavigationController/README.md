# UINavigationController
 위 페이지는 xcode의 component의 "UINavigationController"에 대해 정리한 페이지입니다.    
 
 ## 네비게이션과 모달
 개발자는 많은 기능을 제공하길 원한다.      
 많은 기능은 많은 페이지를 통해 제공한다.      
 
 목표      
 1. 서비스 제공자의 의도를 파악      
 2. 앱 사용성을 쉽게 인지하게 하기 위해       
 
 ### Modality
 1. Alert: 경고창      
 2. Modal View: 모달 창       
      
 : 사용자에게 '집중'을 요구할 때 뜨는 화면      
 1. 사용자에게 필요시 액션을 요구     
 2. 화면을 나가기 위한 명확한 행동 필요 ex> 닫기창, 스와이프 액션       
 
 종류
 iOS에서 제공해주는 모달
 1. alert      
 2. activity views      
 3. share sheets      
 4. action sheets     
      
 개발자가 직접 제공해주는 모달     
 : 직접 제공시 모달을 띄우는 스타일을 지정해줘야 한다.     
 1. automatic: 시스템에서 자동으로 .pagesheet 형식을 선택하여 모달을 띄운다.      
 2. full screen: 페이지를 꽉 채워서 모달을 띄운다.     
 3. pop over: 아이템 쪽에 팝업 창을 띄우는 식으로 모달을 띄운다.      
 4. page sheet and form sheet: form sheet는 반 정도 올라오는 페이지며, bottom sheet라고도 불린다.     
 
 구현       
 UIViewController 클래스에 내장되어 있는,     
 present(_:animated:completion:) 메소드를 사용한다.       
 
 
  
 ### Navigation
 1. 앱 사용시, 앱의 기능을 탐색하고 빠져나올 때 도와줌
 2. 자연스럽게 검색해온 페이지들로 돌아갈 수 있음      
 3. 뎁스가 깊어지지 않게 구성하는 것이 중요하다.    
      
종류      
1. Hierarchical Navigation     
: 화면에서 한 페이지를 선택하면 다음 뎁스로 넘어가는 네비게이션       
2. Flat Navigation       
: 카테고리에서 선택하는 네비게이션, 주로 탭바가 같이 사용됨      
3. Content Drive or Experience Driven navigation    
: 콘텐츠 자체가 네비게이션 스타일을 구성하는 경우      

한 앱 내에서 네비게이션의 여러 종류가 복합적으로 사용된다.      
      
: HIG(Human Interface Guide) 원칙을 준수하자!      

 
 
       
 ## Navigation Controller란?
: 여러 View Controller 간에 네비게이팅을 도와주는 View Controller
 
 ## ViewController에 네비게이션 추가 방법
1. Storyboard 클릭      
2. Editor -> Embed In -> Navigation Controller      
3. View Controller 옆에 Navigation Controller 추가된다.  
 
      
## Navigation Controller 컴포넌트 속성 정리     
```swift
Navigation Bar
    |_ Attributes inspector
        |_ Navigation Bar   
            |_ Style
                |_ Prefers Large Titles: 해당 부분을 체크하면, 처음에는 Large Title이 보였다가  
                                        컬렉션뷰를 위로 슬라이드 하면 Title이 위로 올라가며 작아진다. 
        
Navigation Item
    |_ Attributes inspector
        |_ Navigation Item
            |_ Title: 해당 ViewController의 네비게이션 Title을 지정할 수 있다.
```

## Navigation Controller 구현시 도움되는 문법 리스트
### 코드에서 Navigation Controller의 title 작성 방법
```swift
// 네비게이션 컨트롤러의 네비게이션 아이템 title 작성 방법
navigationController?.navigationBar.topItem?.title = "☀️ Apple Frameworks"

// 현재 View Controller에 Navigation Controller가 Embed In 되어 있을 경우
self.navigationItem.title = " "
```
