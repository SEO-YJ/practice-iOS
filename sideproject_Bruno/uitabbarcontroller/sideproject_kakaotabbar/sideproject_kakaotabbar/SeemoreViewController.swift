//
//  SeemoreViewController.swift
//  sideproject_kakaotabbar
//
//  Created by 서유준 on 2022/11/04.
//

import UIKit

class SeemoreViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    let seemoreList: [SeemoreModel] = SeemoreModel.list
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.dataSource = self
        collectionView.delegate = self
        
        // collectionView의 content inset
        collectionView.contentInset = UIEdgeInsets(top: 20, left: 30, bottom: 20, right: 30)
        if let flowlayout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout {
            flowlayout.estimatedItemSize = .zero
        }
    }
}

extension SeemoreViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return seemoreList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SeemoreCollectionViewCell", for: indexPath) as? SeemoreCollectionViewCell else {
            return UICollectionViewCell()
        }
        
        let seemore = seemoreList[indexPath.item]
        cell.configure(seemore)
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
