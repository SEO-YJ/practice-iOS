# Stack View
 위 페이지는 xcode의 component의 "Stack View"에 대해 정리한 페이지입니다.    
       
 ## Stack View 특징     
 1. StackView는 컴포넌트 끼리 개발자가 AutoLayout을 설정 안해도 자동으로 컴포넌트를 알아서 채워준다.     
 -> 자동으로 component의 위치를 잡아준다.       
 
 2. Stack View를 많이 사용해야 하는 이유    
 Swift UI에서 Stack View를 많이 사용한다.    
 따라서, UI Kit -> Swift UI로의 일대일 대응을 위해 Stack View를 사용하는 연습을 하자.     
 
 ## Vertical Stack View 
 ### Vertical Stack View와 Image View 
 1. Vertiacl Stack View에 Image View를 넣을 때, 실제로 이미지를 넣어주면 에러가 사라진다.   
 
 2. Vertical Stack View 내에 이미지를 넣을 때 크기 설정      
    1) 제약사항 설정: Navigation -> control + 드래그 -> height (Horizontal은 width)     
    2) height의 constraints 설정     
    3) constant 값 조절하여 원하는 크기에 맞게 사용     
       
3. Vertical Stack View 내에 이미지를 넣을 때 비율 설정     
    1) Image View 클릭      
    2) Attributes inspector -> View -> Content Mode      
    3) Aspect Fit: Image View의 크기를 조절해도 내부의 이미지가 비율에 맞게 조절된다.     
    -> 기본적으로 Image View 사용시 Aspect Fit으로 사용       
    
4. Vertical Stack View 내에 Button을 넣는 경우 생기는 문제      
: Stack View에 지정된 영역에 Button이 꽉 차게 들어간다. Button의 크기를 조절하려면 다음과 같이 해결하자.     
    1) UIView를 하나 생성한다.      
    2) StackView내에 UIView를 넣고 UIView의 영역을 조정하자.     
        1) View의 Height를 Constraints 건다.   
    3) UIView내에 Button을 넣자.    
    4) UIView와 Button 사이에 Constraints를 걸어 원하는 위치에 Button을 위치시킨다.     
    5) Button의 AutoLayout이 업데이트 되지 않을 경우, 'option+command+ + '로 컴포넌트의 AutoLayout을 업데이트 한다.      
       
5. Stack View 내에 컴포넌트를 좌우, 상하에 여백을 주고 싶을 경우      
    1) UIView 생성한다.      
    2) UIView를 StackView에 넣는다.      
    3) UIView의 Height에 Constraints를 설정한다.      
    4) 컴포넌트를 UIView에 넣는다.      
    5) UIView와 컴포넌트의 Constraints를 건다.      
    6) 컴포넌트의 AutoLayout이 업데이트 되지 않을 경우, 'option+command+ + '로 컴포넌트의 AutoLayout을 업데이트 한다. 
    
## Stack View 컴포넌트 속성 정리     
```swift

Stack View      
    |_ Attributes inspector     
        |_ Stack View   
            |_ Axis: 컴포넌트를 쌓는 스택뷰 축을 결정한다.      
                |_ Horizontal: 좌우로 컴포넌트를 쌓는다.(수평적)      
                |_ Vertical: 위아래로 컴포넌트를 쌓는다.(수직적)   
            |_ Distribution: 스택뷰 내의 컴포넌트 분배를 결정한다.     
                |_ Fill: 컴포넌트를 스택뷰에 꽉 채운다. 각 컴포넌트의 크기는 개발자가 제약사항을 걸어 결정한다.     
                |_ Fill Equally: 컴포넌트를 스택뷰에 동일한 비율로 채운다.     
            |_ Spacing: 스택뷰 내의 컴포넌트 사이의 공백을 관리한다.      
        |_ View     
            |_ Content Mode: Image View의 내부 이미지를 원하는 비율만큼 채울 수 있다.     
```

    



