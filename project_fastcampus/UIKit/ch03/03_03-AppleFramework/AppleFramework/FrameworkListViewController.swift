//
//  FrameworkListViewController.swift
//  AppleFramework
//
//  Created by 서유준 on 2022/10/29.
//

import UIKit

class FrameworkListViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    let list: [AppleFramework] = AppleFramework.list
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.dataSource = self
        collectionView.delegate = self
        
        // 네비게이션 컨트롤러의 네비게이션 아이템 title 작성 방법
        navigationController?.navigationBar.topItem?.title = "☀️ Apple Frameworks"
        
        // 컬렉션 뷰의 Estimate Size 코드로 설정 방법
        if let flowlayout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout {
            flowlayout.estimatedItemSize = .zero
        }
        
        // 컬렉션 뷰 컨텐츠의 padding 설정 방법
        collectionView.contentInset = UIEdgeInsets(top: 20, left: 16, bottom: 0, right: 16)
    }
}

extension FrameworkListViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return list.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        // 꼭 이 함수에서는 reusableCell을 deque해줘야 한다.
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "FrameworkCell", for: indexPath) as? FrameworkCell else {
            return UICollectionViewCell()
        }
        
        let framework = list[indexPath.item]
        cell.configure(framework)
        
        return cell
    }
}

extension FrameworkListViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        // 그리드뷰 만드는 법
        
        // 행 위에 있는 각 셀들의 여백을 상수로 할당한다.
        let interItemSpacing: CGFloat = 10
        let padding: CGFloat = 16
        
        // 셀 하나의 너비값을 할당한다.
        let width = (collectionView.bounds.width - interItemSpacing * 2 - padding * 2) / 3
        
        // 셀 하나의 높이값을 할당한다.
        let height = width * 1.5
        
        // 셀의 하나의 너비, 높이 값을 반환한다.
        return CGSize(width: width, height: height)
    }
    
    // cell 들 간의 수평 공백을 명시적으로 정해주는 함수
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
    
    // cell 들 간의 수직 공백을 명시적으로 정해주는 함수
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
}

extension FrameworkListViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        // 컬렉션 뷰의 셀 선택시에 셀의 이름을 출력해보자.
        let framework = list[indexPath.item]
        print(framework.name)
    }
}
