//
//  SearchViewController.swift
//  InstaSearchView
//
//  Created by 서유준 on 2022/11/02.
//

import UIKit

class SearchViewController: UIViewController {
    @IBOutlet weak var collectionView: UICollectionView!
    
    let list: [SearchModel] = SearchModel.list
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.delegate = self
        collectionView.dataSource = self
        
        // CollectionView의 EstimateSize를 none으로 작성하는 방법
        // Storyboard에서는 변경사항을 확인하기 번거로우니 코드로 작성하는 것이 용이하다.
        if let flowlayout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout {
            flowlayout.estimatedItemSize = .zero
        }
        self.navigationItem.title = "Search"
        let searchController = UISearchController(searchResultsController: nil)
        searchController.hidesNavigationBarDuringPresentation = false
        searchController.searchBar.placeholder = "Search"
        searchController.searchResultsUpdater = self
        self.navigationItem.searchController = searchController
    }
}

extension SearchViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        /*
         DataModel 파일을 생성하지 않고, Assets의 이미지들을 사용하는 법
            Assets에 저장된 이미지의 갯수만큼 정수로 반환해주면 된다.
            현재 Assetsdml image의 갯수는 24개 이므로 24를 반환해주면 된다.
         
         return 24
         */
        return list.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SearchCollectionViewCell", for: indexPath) as? SearchCollectionViewCell else {
            return UICollectionViewCell()
        }
        /*
         DataModel 파일을 생성하지 않고, Assets의 이미지들을 사용하는 법
            Assets에 저장된 이미지의 이름을 그대로 String 타입에 할당하여 사용한다.
            indexPath.item은 위 함수에서 '0' 부터 Item의 갯수만큼 1씩 증가한다.
            현재 Assets의 imageName은 'Animal1'부터 시작하므로 +1을 넣어주었다.
         
         let search = "animal\(indexPath.item + 1)"
         */
        let search = list[indexPath.item]
        cell.configure(search)
        return cell
    }
}

extension SearchViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let interItemSpacing: CGFloat = 1
        let width = (collectionView.bounds.width - interItemSpacing * 2) / 3
        let height = width
        return CGSize(width: width, height: height)
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 1
    }
}

extension SearchViewController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        let search = searchController.searchBar.text
        print("search: \(search)")
    }
}
