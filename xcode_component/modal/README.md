# Modal
 위 페이지는 xcode의 component의 "Modal"에 대해 정리한 페이지입니다.    
       
 ## 네비게이션과 모달 
 사용 이유     
 1. 앱에서 많은 기능을 제공해주기 위해서      
 2. 사용자가 서비스 제공자의 의도를 알도록 하기 위해서     
 3. 앱 사용성을 쉽게 하기 위해서       
       

       
 ## Modal 란?
: 사용자에게 일시적으로 집중을 요구하는 컨텐츠를 제공할 때 띄우는 화면     

요구사항     
1. 주요한 컨텐츠 내용이므로 꼭 확인해라       
2. 입력 등을 받기 위한 경우     
     
주의사항     
1. 화면을 나가기 위해, 닫기 버튼 클릭, 스와이프 다운 등을 서비스 제공자는 구성해야 한다.       

## Modal 종류  
### 시스템 모달      
1. alert     
2. activity views     
3. share sheets      
4. action sheets      

### 개발자가 직접 제공하는 모달      
1. automatic     
2. fullscreen      
3. popover       
4. page sheet and form sheet      

구현방법     
: ViewController의 present(_:animated:completion:) 메소드를 사용      

 
 ## CollectionView에 Modal 사용 방법 - Code
 ```swift
 // 1. collectionView의 delegate에 self 넘겨준다. 
 override func viewDidLoad() {
 collectionView.delegate = self
}

// 2. 현재 ViewController에 collectionViewDelegate를 extension 한 후 코드를 작성한다.
extension (현재 ViewController): UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        // 데이터의 배열에 현재 데이터값 할당
        let framework = list[indexPath.item]
        print(">>> selected: \(framework.name)")
        
        // 스토리보드의 셀 불러오기
        // 1. 스토리보드 인스턴스 생성
        let storyboard = UIStoryboard(name: "Detail", bundle: nil)
        // 2. 스토리보드 인스턴스의 instantiateViewController 메소드에 불러올 셀의 storyboardID를 전달인자로 전달
        // 3. 해당 셀의 타입으로 강제 타입캐스팅
        let vc = storyboard.instantiateViewController(withIdentifier: "FrameworkDetailViewController") as! FrameworkDetailViewController
        vc.framework = framework
        // 4. present 메소드로 모달창 띄우기
        present(vc, animated: true)
    }
}
  ```
 

## Modal 구현시 도움되는 문법 리스트
### Safari 브라우저 여는 법
```swift
import SafariServices 

        // URL 타입의 이니셜라이저가 옵셔널로 되어있어서 옵셔널 바인딩 해주어야 한다.
        guard let url = URL(string: framework.urlString) else {
            return
        }
        let safari = SFSafariViewController(url: url)
        present(safari, animated: true)
```
