# UIImageView
 위 페이지는 xcode의 component의 "UIImageView"에 대해 정리한 페이지입니다.    
       
### 여러 Image를 상수에 저장하는 방법  
```swift
// 여러 이미지를 사용
// 배열에 이미지의 이름을 String 타입으로 저장
// 이 배열에 있는 이미지들을 꺼내서 사용하면 된다.
let weathers = ["sun.max.fill", "wind", "cloud"]
```

### ImageView와 Image를 연결
```swift
// 이미지의 이름을 상수에 저장
let iamgeName = "sun.max.fill"
// ImageView를 outlet 변수로 코드에 연결하고, 저장한 이미지를 할당
oulet변수.image = UIImage(systemName: imageName)
```

## UIImageView 컴포넌트 속성 정리
 ```swift

UIImageView    
    |_ Attributes inspector     
        |_ Image View     
            |_ Render Mode: 이미지의 렌더링 모드를 변경한다.     
                |_ Multicolor: 이미지 원래의 본래 색상으로 이미지를 렌더링한다.     
                                code: UIImage(systemName: imageName)?.withRenderingMode(.alwaysOriginal)       
                |_  Monochrome: 이미지의 템플릿으로 이미지를 렌더링한다. (Tint 색상으로 이미지가 렌더링된다.)         
                                code: UIImage(systemName: imageName)?.withRenderingMode(.alwaysTemplate)      
                |_ Palette: 이미지의 내, 외부 색상을 설정하여 렌더링한다.      
        |_ View     
            |_ Content Mode: Image View의 내부 이미지를 원하는 비율만큼 채울 수 있다.     
                            (주로 Image View의 크기에 따라 내부의 비율에 맞게 조정되는 Aspect Fit 사용)      
                |_ Aspect Fit: Image View의 크기 조절에 따라 이미지를 비율에 맞게 조절해준다.     
                               원래 원본 이미지가 다 보이도록 이미지를 비율에 맞게 조정한다.     
                               원본 이미지는 다 보이나, Image View를 꽉 채우지 못 하는 경우가 많다.    
                |_ Aspect Fill: Image View의 영역을 꽉 채운다.     
                                원본 이미지가 다 보이지 않아도, 원본 이미지의 비율에 맞게 Image View를 꽉 채운다.
                                비율은 맞으나 원본 이미지가 짤리는 경우가 많다.
                
```

        



