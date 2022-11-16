//
//  TransportationCollectionViewCell.swift
//  apptool_uicollectionview_transportation
//
//  Created by 서유준 on 2022/10/26.
//

import UIKit

class TransportationCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var transportationIconImageView: UIImageView!
    @IBOutlet weak var transportationNameLabel: UILabel!
    
    func configure(_ transportation: TransportationModel) {
        transportationIconImageView.image = UIImage(systemName: transportation.transportationIcon)
        transportationNameLabel.text = transportation.transportationName
    }
}
