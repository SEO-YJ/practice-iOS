# Label
 위 페이지는 xcode의 component의 "Label"에 대해 정리한 페이지입니다.    
 
 ### Label의 Text를 코드에서 사용 
 ```swift
// Label의 Text 설정
// String 타입의 값으로 할당
outlet변수.text = "안녕하세여"
```

## Label 컴포넌트 속성 정리
```swift

Label 
    |_Attributes inspector     
        |_ Label     
            |_ Text: Text 입력을 할 수 있다.    
                     Text 입력 시 다음줄로 넘어가고 싶으면, control+엔터를 누르면 된다.     
            |_ Lines: Label의 줄 갯수를 설정하여, 해당 값 만큼 줄을 가질 수 있다.    
                     줄의 갯수 만큼 Height 값이 균일하게 증가한다.      
                     Lines의 상수값이 0일 경우에는, text를 표시할 수 있는 범위까지 줄 갯수가 늘어난다.     
    |_ Size inspector
        |_ Content Hugging Priority
        |_ Content Compression Resistance Priority
        : Label의 크기가 작아지는 것을 저항하는 값 (쪼그라 지는 것에 대한 저항력)
        : 두 컴포넌트의 값을 비교하여 저항력이 더 작은 값의 컴포넌트가 줄어든다.
        
```



