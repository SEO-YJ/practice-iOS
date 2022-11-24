//
//  TransportationViewController.swift
//  apptool_modal_transportation
//
//  Created by 서유준 on 2022/11/21.
//

import UIKit

class TransportationViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var pageControl: UIPageControl!
    var list: [TransportationModel] = TransportationModel.list
    @IBOutlet weak var reButton: UIButton!
    
    var dataSource: UICollectionViewDiffableDataSource<Section, Item>!
    enum Section {
        case main
    }
    typealias Item = TransportationModel
    
    var curated: Bool = false
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dataSource = UICollectionViewDiffableDataSource<Section, Item>(collectionView: collectionView, cellProvider: { collectionView, indexPath, item in
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "TransCollectionViewCell", for: indexPath) as? TransCollectionViewCell else {
                return nil
            }
            cell.configure(data: item)
            cell.backgroundColor = UIColor.systemBlue
            return cell
        })
        
        var snapshot = NSDiffableDataSourceSnapshot<Section, Item>()
        snapshot.appendSections([.main])
        snapshot.appendItems(list, toSection: .main)
        dataSource.apply(snapshot)
        updateButtonTitle()
        pageControl.numberOfPages = list.count
        
        collectionView.collectionViewLayout = layout()
        collectionView.delegate = self
    }
    private func layout() -> UICollectionViewCompositionalLayout {
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.8), heightDimension: .absolute(250))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
        let section = NSCollectionLayoutSection(group: group)
        section.orthogonalScrollingBehavior = .groupPagingCentered
        section.interGroupSpacing = 20
        section.visibleItemsInvalidationHandler = { (item, offset, env) in
            let index = Int((offset.x / env.container.contentSize.width).rounded(.up))
            print(index)
            self.pageControl.currentPage = index
        }
        let layout = UICollectionViewCompositionalLayout(section: section)
        return layout
    }
    func updateButtonTitle() {
        let title = curated ? "See Transportation" : "See URL"
        reButton.setTitle(title, for: .normal)
    }
    
    @IBAction func tappedReset(_ sender: Any) {
        curated.toggle()
        
        self.list = curated ? TransportationModel.urlList : TransportationModel.list
        pageControl.numberOfPages = list.count
        
        var snapshot = NSDiffableDataSourceSnapshot<Section, Item>()
        snapshot.appendSections([.main])
        snapshot.appendItems(list, toSection: .main)
        dataSource.apply(snapshot)
        updateButtonTitle()
    }
}

extension TransportationViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if curated == true {
            let data = list[indexPath.item]
            
            let storyboard = UIStoryboard(name: "Detail", bundle: nil)
            let vc = storyboard.instantiateViewController(withIdentifier: "TransportationUrlViewController") as! TransportationUrlViewController
            vc.data = data
            present(vc, animated: true)
        }
    }
}
