//
//  SeemoreViewController.swift
//  sideproject_kakaoseemorelist
//
//  Created by 서유준 on 2022/11/01.
//

import UIKit

class SeemoreViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    
    let list: [DataModel] = DataModel.list
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.dataSource = self
        collectionView.delegate = self
        
        // collectionView의 content inset
        collectionView.contentInset = UIEdgeInsets(top: 20, left: 30, bottom: 20, right: 30)
    }
}

extension SeemoreViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return list.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SeemoreCollectionViewCell", for: indexPath) as? SeemoreCollectionViewCell else {
            return UICollectionViewCell()
        }
    let data = list[indexPath.item]
    cell.configure(data)
    
    return cell
    }
}

extension SeemoreViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let cellInterPadding: CGFloat = 40
        
        let padding: CGFloat = 30
    
        let width = ( collectionView.bounds.width - cellInterPadding * 3 - padding * 2 ) / 4
        let height = width * 1.5
        
        return CGSize(width: width, height: height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 20
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 40
    }
}

