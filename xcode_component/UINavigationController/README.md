# UINavigationController
 위 페이지는 xcode의 component의 "UINavigationController"에 대해 정리한 페이지입니다.    
       
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
```
