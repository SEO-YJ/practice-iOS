//
//  PaywallViewController.swift
//  SpotifyPaywall
//
//  Created by joonwon lee on 2022/04/30.
//

import UIKit

/*
// https://developer.spotify.com/documentation/general/design-and-branding/#using-our-logo
// https://developer.apple.com/documentation/uikit/nscollectionlayoutsectionvisibleitemsinvalidationhandler
// 과제: 아래 애플 샘플 코드 다운받아서 돌려보기  https://developer.apple.com/documentation/uikit/views_and_controls/collection_views/implementing_modern_collection_views
*/


class PaywallViewController: UIViewController {
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var pageControl: UIPageControl!
    let list: [BannerInfo] = BannerInfo.list
    let colors: [UIColor] = [.systemPurple, .systemOrange, .systemPink, .systemRed]
    
    var dataSource: UICollectionViewDiffableDataSource<Section, Item>!
    enum Section {
        case main
    }
    typealias Item = BannerInfo
    
     override func viewDidLoad() {
        super.viewDidLoad()
         //MARK: 1. Presentation: UICollectionViewDiffableDatasource
         dataSource = UICollectionViewDiffableDataSource<Section, Item>(collectionView: collectionView, cellProvider: { collectionView, indexPath, item in
             guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "BannerCell", for: indexPath) as? BannerCell else {
                 return nil
             }
             cell.configure(item)
             // 배열에 색깔들 저장하고, Presentation에서 셀의 배경 색상 정해주는 방법
             cell.backgroundColor = self.colors[indexPath.item]
             return cell
        })
         
         //MARK: 2. Data: Snapshot
         var snapshot = NSDiffableDataSourceSnapshot<Section, Item>()
         snapshot.appendSections([.main])
         snapshot.appendItems(list, toSection: .main)
         dataSource.apply(snapshot)
         
         //MARK: 3. Layout: UICollectionViewCompositionalLayout
         collectionView.collectionViewLayout = layout()
         
         pageControl.numberOfPages = list.count
         
         // 수직 스크롤 제한 하는 방법
         collectionView.alwaysBounceVertical = false
     }
    
    private func layout() -> UICollectionViewCompositionalLayout {
        
        // group 사이즈 그대로 따라가면 되기에 .fractional(1)
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        
        // height: Storyboard에서 200으로 고정했으므로 .absolute(200)
        /*
         NSCollectionLayoutGroup.horizontal로 했는데, 셀이 아래로 내려가는 이유
         Section의 width가 작아 셀이 잘리기 때문이다.
         
         답
         1. 스크롤로 적용할 경우: section.orthogonalScrollingBehavior = .continuous
         2. 페이징을 적용할 경우: section.orthogonalScrollingBehavior = .groupPaging
         3. 페이지를 가운데로 위치하여 페이징을 적용할 경우: section.orthogonalScrollingBehavior = .groupPagingCentered
         
         
         */
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.8), heightDimension: .absolute(200))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
        
        let section = NSCollectionLayoutSection(group: group)
        section.orthogonalScrollingBehavior = .groupPagingCentered
        section.interGroupSpacing = 20
        
        section.visibleItemsInvalidationHandler = { (item, offset, env) in
            let index = Int((offset.x / env.container.contentSize.width).rounded(.up))
            self.pageControl.currentPage = index
        }
        
        let layout = UICollectionViewCompositionalLayout(section: section)
        return layout
    }
}
