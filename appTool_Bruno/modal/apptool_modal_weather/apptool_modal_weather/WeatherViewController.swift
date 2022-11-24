//
//  WeatherViewController.swift
//  apptool_modal_weather
//
//  Created by 서유준 on 2022/11/21.
//

import UIKit

class WeatherViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    var list: [Weather] = Weather.list
    @IBOutlet weak var reButton: UIButton!
    var curated: Bool = false
    
    var dataSource: UICollectionViewDiffableDataSource<Section, Item>!
    enum Section {
        case main
    }
    typealias Item = Weather
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dataSource = UICollectionViewDiffableDataSource<Section, Item>(collectionView: collectionView, cellProvider: { collectionView, indexPath, item in
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "WeatherCollectionViewCell", for: indexPath) as? WeatherCollectionViewCell else {
                return nil
            }
            cell.configure(item)
            cell.backgroundColor = UIColor.systemBlue
            cell.layer.cornerRadius = 20
            return cell
        })
        
        var snapshot = NSDiffableDataSourceSnapshot<Section, Item>()
        snapshot.appendSections([.main])
        snapshot.appendItems(list, toSection: .main)
        dataSource.apply(snapshot)
        
        collectionView.collectionViewLayout = layout()
        updateButtonTitle()
        collectionView.delegate = self
    }
    func layout() -> UICollectionViewCompositionalLayout {
        
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .estimated(50))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .estimated(50))
        let group = NSCollectionLayoutGroup.vertical(layoutSize: groupSize, subitems: [item])
        
        let section = NSCollectionLayoutSection(group: group)
        section.contentInsets = NSDirectionalEdgeInsets(top: 10, leading: 10, bottom: 10, trailing: 10)
        section.interGroupSpacing = 15
        
        let layout = UICollectionViewCompositionalLayout(section: section)
        return layout
    }
    func updateButtonTitle() {
        let title = curated ? "See Weather" : "See URL"
        reButton.setTitle(title, for: .normal)
    }
    
    @IBAction func changeView(_ sender: Any) {
        curated.toggle()
        self.list = curated ? Weather.weatherUrl : Weather.list
        var snapshot = NSDiffableDataSourceSnapshot<Section, Item>()
        snapshot.appendSections([.main])
        snapshot.appendItems(list, toSection: .main)
        dataSource.apply(snapshot)
        updateButtonTitle()
    }
}

extension WeatherViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if curated == true {
            let data = list[indexPath.item]
            
            let storyboard = UIStoryboard(name: "Detail", bundle: nil)
            let vc = storyboard.instantiateViewController(withIdentifier: "WeatherDetailViewController") as! WeatherDetailViewController
            vc.data = data
            present(vc, animated: true)
        }
    }
}
