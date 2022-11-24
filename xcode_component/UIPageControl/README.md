# UIPageControl
 위 페이지는 xcode의 component의 "UIPageControl"에 대해 정리한 페이지입니다.    
       
 ## Page Control 란?
: UIScrollView, UICollectionView 등 스크롤이 가능한 View의 페이지를 도와주는 Control

 
 ## UICollectionView에서 UIPageControl 사용 방법 - Code
 1. UIPageControl를 ViewController 코드에 아울렛 변수로 선언
 
 ### Page Control의 페이지 갯수
 ```swift
pageControl.numberOfPages = 데이터의 갯수
```

 ### Page Control의 현재 페이지 설정
  ```swift
pageControl.currentPage = 인덱스 값
```
 
 1. UICollectionView는 UIScrollView를 상속받아 구성된 클래스이다.
 2. 그러므로, UISrollView의 프로토콜을 확장할 수 있다.
  ```swift
 extension [pageControl이 선언된 ViewController]: UIScrollViewDelegate {
    /*
    // scrollViewDidScroll: 현재 스크롤 되는 방향을 파악할 수 있다.
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        print(Int(scrollView.contentOffset.x / self.collectionView.bounds.width))
    }
     */
     // scrollViewDidEndDecelerating: 스크롤이 천천이 움직이다 멈추는 것을 확인할 수 있다.
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        // scrollView.contentOffset.x: 스크롤뷰의 x 좌표
        // self.collectionView.bounds.width: 현재 ViewController 내의 collectionView의 너비 값
        let index = Int(scrollView.contentOffset.x/self.collectionView.bounds.width)
        
        // Page Control의 현재 페이지(0부터 시작)
        pageControl.currentPage = index
        print("멈췄다!!")
    }
}
```
 

 
      
## Page Control 컴포넌트 속성 정리     
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

## Page Control 구현시 도움되는 문법 리스트
### 코드에서 Navigation Controller의 title 작성 방법
```swift
// 네비게이션 컨트롤러의 네비게이션 아이템 title 작성 방법
navigationController?.navigationBar.topItem?.title = "☀️ Apple Frameworks"

// 현재 View Controller에 Navigation Controller가 Embed In 되어 있을 경우
self.navigationItem.title = " "
```
