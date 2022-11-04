# UISearchController
 위 페이지는 xcode의 component의 "UISearchController"에 대해 정리한 페이지입니다.    
       
 ## Search Controller란?
: 검색을 통해 원하는 View Controller로 이동하는 Controller     

 
 ## Navigation Controller에 SearchView 추가 방법 - Code
 ```swift
 // UISearchController 객체 생성
let searchController = UISearchController(searchReseultContoller: nil)
 // UISearchController Property: 네비게이션바가 보이는 동안 숨길 것인지 결정하는 프로퍼티 값 할당
 searchController.hidesNavigationBarDuringPresents = false
 // UISearchController Property: placeholder에 값 할당
 searchController.searchBar.placeholder = "search"
 // UISearchController Protocol: UISearchResultsUpdating 프로토콜을 준수
 searchController.searchResultsUpdater = self
 
 UISearchResultsUpdating 프로토콜 준수
 extension SearchViewController: UISearchResultsUpdating {
 // SearchBar에 문자를 하나씩 입력할 때마다 아래 함수 실행
    func updateSearchResults(for searchController: UISearchController) {
        let search = searchController.searchBar.text
        // 콘솔에서 키보드로 입력한 문자들을 확인가능
        print("search: \(search)")
    }
}

// 현재 ViewController의 Navigation Item의 SearchController에 생성한 객체 할당
self.navigationItem.searchController = searchController
```

 
      
## Search Controller 컴포넌트 속성 정리     
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
