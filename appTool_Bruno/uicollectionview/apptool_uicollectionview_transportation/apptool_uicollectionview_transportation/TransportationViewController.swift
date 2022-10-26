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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.dataSource = self
        collectionView.delegate = self
        
    }
}

extension TransportationViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return transportationList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "TransportationCollectionViewCell", for: indexPath) as? TransportationCollectionViewCell else {
            return UICollectionViewCell()
        }
        let transportation = transportationList[indexPath.item]
        
        cell.configure(transportation)
        return cell
    }
}

extension TransportationViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.bounds.width, height: 70)
    }
}
