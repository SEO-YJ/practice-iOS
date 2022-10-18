# Stack View
 위 페이지는 xcode의 component의 "Stack View"에 대해 정리한 페이지입니다.    
 
 ### Stack View를 많이 사용해야 하는 이유
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

 Vertical Stack View      
    |_ Attributes inspector     
        |_ View     
            |_ Content Mode: Image View의 내부 이미지를 원하는 비율만큼 채울 수 있다.     
    



