//
//  FigureViewController.swift
//  apptool_uicollectionview_grid_figure
//
//  Created by 서유준 on 2022/11/01.
//

import UIKit

class FigureViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    let list: [FigureModel] = FigureModel.list
    
    /*
     1. Diffable Datasource 변수 선언
     SectionIdentifierType: Section
     ItemIdentifierType: Item
     */
    var dataSource: UICollectionViewDiffableDataSource<Section, Item>!
    
    typealias Item = FigureModel
    enum Section {
        case main
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Presentation
        /*
         2. Diffable Datasource 변수에 값 할당
         */
        dataSource = UICollectionViewDiffableDataSource<Section, Item>(collectionView: collectionView, cellProvider: { collectionView, indexPath, item in
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "FigureCollectionViewCell", for: indexPath) as? FigureCollectionViewCell else {
                return nil
            }
            cell.configure(item)
            return cell
        })
        
        // Data
        /*
         3. snapshot에 데이터 채우고, datasource에 채운 데이터 전달
         */
        var snapshot = NSDiffableDataSourceSnapshot<Section, Item>()
        snapshot.appendSections([.main])
        snapshot.appendItems(list, toSection: .main)
        dataSource.apply(snapshot)
        
        // Layout
        /*
         4. compositional layout 적용
         */
        collectionView.collectionViewLayout = layout()
    }
    
    private func layout() -> UICollectionViewCompositionalLayout {
        
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.33), heightDimension: .fractionalHeight(1))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalWidth(0.4))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitem: item, count: 3)
        
        let section = NSCollectionLayoutSection(group: group)
        // section의 content inset 지정
        section.contentInsets = NSDirectionalEdgeInsets(top: 20, leading: 16, bottom: 0, trailing: 16)
        
        let layout = UICollectionViewCompositionalLayout(section: section)
        return layout
    }
}




