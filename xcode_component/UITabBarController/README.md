# UITabBarController
 위 페이지는 xcode의 component의 "UITabBarController"에 대해 정리한 페이지입니다.    
       
 ## Tab Bar Controller란?
: 앱에서 더 많은 View를 보여주기 위해 사용되는 Controller 입니다.     
ex> 아파트 vs 전원주택      
아파트: 정해진 영역에 많은 집들이 있다 -> 정해진 영역에 많은 View들이 있다 -> Tab Bar Controller 사용한다.      
전원주택: 정해직 영역에 적은 집들이 있다 -> 정해진 영역에 적은 View들이 있다 -> Tab Bar Controller 사용하지 않는다.      
 
 ## Tab Bar Controller 특징
1. 'UITabBarController'를 클래스를 사용한다.     
2. 'UITabBarController'는 여러 'View Controller'들을 관리할 수 있다.           
    * setViewControllers() 메소드를 통해 코드로 설정 가능하다.    
    * viewControllers 프로퍼티를 통해 세팅된 'View Controller'들을 확인 가능하다.     
    * selectedIndex를 통해 어떤 'View Controller'가 선택되었는지 확인 가능하다.      
3. 'UITabBarController'는 Tab Bar Item을 가지고 있다.     
4. 'UITabBarController'에 'View Controller'를 추가하면, Tab Bar Item이 하나씩 생기며,       
    각 View Controller에서 'UITabBarItem'의 image, title 프로퍼티를 설정하면 된다.      
핵심: Tab Bar Controller 안에 여러 View Controller가 있다!      
     
## Tab Bar Controller 구현 방법 - Storyboard
1. Tab Bar Controller를 넣을 View Controller 클릭      
2. Editor -> Embed In -> Tab Bar Controller     
3. Tab Bar Controller 연결 완료     
4. 여러 View Controller를 Tab Bar Controller로 관리하는 방법      
    1) 관리할 View Controller들을 생성     
    2) Tab Bar Controller 클릭      
    3) Control 키 누른 상태에서 View Controller 연결     
    4) Relationship Segue -> viewcontrollers 클릭      
      
## Tab Bar Controller로 Navigation Controller 관리하는 방법      
1. Tab Bar Controller를 Embed In 한 View Controller에 Navigation Controller를 Embed In
```swift
* Depth
 _________________
|                 |
|  Tab Bar        |
|  Controller     |
|                 |
|_________________|
        |
        |
        |
       \ /
 _________________
|                 |         
|  Navigation     |
|  Controller     |
|                 |
|_________________|
        |
        |
        |
       \ /
 _________________
|                 |         
|  View           |
|  Controller     |
|                 |
|_________________|
첫번째 Root View Controller

: Tab Bar Controller는 여러 View Controller를 관리할 수 있다.
그 중에 View Controller의 네비게이션을 담당하는 Navigation Controller도 관리할 수 있다.
```
 
      
## Tab Bar Controller 컴포넌트 속성 정리     
```swift
UITabBarItem
    |_ Attributes inspector
        |_ Tab Bar Item
        |_ Bar Item
            |_ Title: Tab Bar Item의 Title을 설정. 이미지만 넣고 싶을 시에 해당 부분 공백      
            |_ Image: Tab Bar Item의 Image 설정. 
        
UITabBar
    |_ Attributes inspector
        |_ Tab Bar
            |_ Image Tint: 이미지의 tint 색상을 설정      
                          * Tint 색상 Label Color로 설정시 다크모드, 라이트모드 대응 가능하다.
```

## Navigation Controller 구현시 도움되는 문법 리스트
### 코드에서 Navigation Controller의 title 작성 방법
```swift
// 네비게이션 컨트롤러의 네비게이션 아이템 title 작성 방법
navigationController?.navigationBar.topItem?.title = "☀️ Apple Frameworks"
```
