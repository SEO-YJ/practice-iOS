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




