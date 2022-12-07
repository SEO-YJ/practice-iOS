//
//  FrameworkListViewController.swift
//  AppleFramework
//
//  Created by joonwon lee on 2022/04/24.
//

import UIKit

class FrameworkListViewController: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    let list: [AppleFramework] = AppleFramework.list
    
    // Diffable Datasource를 이용한 데이터 관리
    /*
     1. Diffable DataSource 변수 선언
     
     CollectionView 구조
     [Section [Item]] [Section [Item]] [Section [Item]]
     
     SectionIdentifier: Hashable -> Section
     Section: enum(열거형) 사용(열거형은 Hashable하다.)
     ItemIdentifier: Hashable -> Item
     저장해놓은 데이터 사용
     원래 데이터는 Hashable 하지 않으므로, Hashable 적용
     그 후에, DiffableDataSource의 인자로 명확한 값을 표현하기 위해, typealias(read-writing) 사용
     */
    var dataSource: UICollectionViewDiffableDataSource<Section, Item>!
    
    typealias Item = AppleFramework
    enum Section {
        case main
    }
    
    // Data, Presentation, Layout
    override func viewDidLoad() {
        super.viewDidLoad()
         // Diffable DataSource
        /*
         2. Diffable DataSource 변수에 값 할당
         collectionView: 아울렛 변수로 연결한 collectionView
         cellProvider:
         
         */
        dataSource = UICollectionViewDiffableDataSource<Section, Item>(collectionView: collectionView, cellProvider: { collectionView, indexPath, item in
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "FrameworkCell", for: indexPath) as? FrameworkCell else {
                return nil
            }
            cell.configure(item)
            return cell
        })
         
         // - Presentation
        
         // Snapshot
         // - Data
        /*
         3. Snapshot 객체 생성
         어떤 Section에 어떤 Item을 넣을거야?
         
         */
        var snapshot = NSDiffableDataSourceSnapshot<Section, Item>()
        // Data 채우기
        snapshot.appendSections([.main])
        snapshot.appendItems(list, toSection: .main)
        // 채워진 Data를 DataSource에 적용하기
        dataSource.apply(snapshot)
        
        /*
         4. Layout 적용하기
         */
        collectionView.collectionViewLayout = layout()
        
        
         // Compositional Layout
         // - Layout
    }
    
    private func layout() -> UICollectionViewCompositionalLayout {
        
        // .fractional: 해당 길이의 비율을 사용하겠다.
        // .fractionalWidth(0.33): 그룹의 너비 중에 아이템의 너비가 3분의 1만큼 사용하겠다.
        // .fractionalHeight(1): 그룹의 높이와 아이템의 높이가 동일
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.33), heightDimension: .fractionalHeight(1))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        
        // .fractionalWidth(1): 섹션의 너비와 그룹의 너비를 동일하게 하겠다.
        // .fractionalWidth(0.33): 섹션의 높이를 그룹의 너비의 3분의 1만큼 사용하겠다.
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalWidth(0.5))
        // group 내에서 item을 3등분으로 균일하게 사용하겠다.
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitem: item, count: 3)
        
        let section = NSCollectionLayoutSection(group: group)
        section.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 70, bottom: 0, trailing: 70)
        let layout = UICollectionViewCompositionalLayout(section: section)

        return layout
    }
}

extension FrameworkListViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let framework = list[indexPath.item]
        print(">>> selected: \(framework.name)")
    }
}
