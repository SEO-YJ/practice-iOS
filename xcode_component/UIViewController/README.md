# UIViewController
 위 페이지는 xcode의 component의 "View Controller"에 대해 정리한 페이지입니다.    
       
 ## View Controller 특징
 : 휴대폰의 한 페이지를 담당하는 객체      
 
 ### Safe Area
 : Contents가 짤리지 않고, 확실히 Contents를 보여줄 수 있는 영역     
 
 ### Contents를 화면에서 더 많이 제공할 수 있는 방법 
 : Safe Area에 걸려있는 AutoLayout을 SuperView에 걸어준다.       
       

 ## View Controller 컴포넌트 속성 정리
 ```swift

View Controller       
    |_ Idendity inspector     
        |_ Custom Class     
            |_ Class: Swift 코드 파일의 이름을 넣어주어, 코드 파일과 Storyboard의 View Controller를 연결     
        |_ Identity     
            |_ Storyboard ID: 스토리보드에서 해당하는 View Controller를 쉽게 찾기 위해 ID 설정       
                             주로, Custom Class의 Class 이름과 동일하게 설정.      
    |_ Attributes inspector
        |_ View Controller 
            |_ Is Initial View Controller: View Controller의 Entry Point를 설정(시뮬 실행시 이 View Controller가 관리하는 화면부터 실행)
```

    



