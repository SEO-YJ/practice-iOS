//
//  TransportationViewController.swift
//  apptool_uicollectionview_transportation
//
//  Created by 서유준 on 2022/10/26.
//

import UIKit

class TransportationViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    
    let transportationList = TransportationModel.list
    
    /*
     1. DataSource 변수 선언
     + 강제 언랩핑하지 않을시, Class has no initializer 에러 발생하므로 체크
     */
    var dataSource: UICollectionViewDiffableDataSource<Section, Item>!
    
    enum Section {
        case main
    }
    typealias Item = TransportationModel
    
    override func viewDidLoad() {
        super.viewDidLoad()
        /*
         2. DataSource 변수에 값 할당
         */
        dataSource = UICollectionViewDiffableDataSource<Section, Item>(collectionView: collectionView, cellProvider: { collectionView, indexPath, item in
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "TransportationCollectionViewCell", for: indexPath) as? TransportationCollectionViewCell else {
                return nil
            }
            cell.configure(item)
            return cell
        })
        
        /*
         3. Snapshot으로 데이터 채우고, snapshot 객체 전달
         */
        var snapshot = NSDiffableDataSourceSnapshot<Section, Item>()
        snapshot.appendSections([.main])
        snapshot.appendItems(transportationList, toSection: .main)
        dataSource.apply(snapshot)
        
        /*
         4. Compositional Layout 구성
         */
        collectionView.collectionViewLayout = layout()
    }
    
    private func layout() -> UICollectionViewCompositionalLayout {
        
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.25), heightDimension: .fractionalHeight(1))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalWidth(0.33))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitem: item, count: 4)
        
        let section = NSCollectionLayoutSection(group: group)
        
        let layout = UICollectionViewCompositionalLayout(section: section)
        return layout
    }
}
