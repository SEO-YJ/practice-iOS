//
//  WeatherViewController.swift
//  apptool_uicollectionview
//
//  Created by 서유준 on 2022/10/23.
//

import UIKit

class WeatherViewController: UIViewController {
    let weatherList: [DataModel] = DataModel.list
    var dataSource: UICollectionViewDiffableDataSource<Section, Item>!
    
    enum Section {
        case main
    }
    typealias Item = DataModel
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        dataSource = UICollectionViewDiffableDataSource<Section, Item>(collectionView: collectionView, cellProvider: { collectionView, indexPath, item in
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "WeatherCollectionViewCell", for: indexPath) as? WeatherCollectionViewCell else {
                return nil
            }
            cell.configure(item)
            return cell
        })
        
        var snapshot = NSDiffableDataSourceSnapshot<Section, Item>()
        snapshot.appendSections([.main])
        snapshot.appendItems(weatherList, toSection: .main)
        dataSource.apply(snapshot)
        
        collectionView.collectionViewLayout = layout()
    }
    private func layout() -> UICollectionViewCompositionalLayout {
        
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.5), heightDimension: .fractionalHeight(1))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalWidth(0.4))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitem: item, count: 2)
        
        let section = NSCollectionLayoutSection(group: group)
        section.contentInsets = NSDirectionalEdgeInsets(top: 20, leading: 16, bottom: 20, trailing: 16)
        
        let layout = UICollectionViewCompositionalLayout(section: section)
        return layout
    }
}




