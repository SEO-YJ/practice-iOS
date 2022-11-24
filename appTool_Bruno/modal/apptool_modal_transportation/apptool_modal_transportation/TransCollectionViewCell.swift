//
//  TransCollectionViewCell.swift
//  apptool_modal_transportation
//
//  Created by 서유준 on 2022/11/23.
//

import UIKit

class TransCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var thumbnailImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.layer.cornerRadius = 16
    }
    
    func configure(data: TransportationModel) {
        titleLabel.text = data.transportationName
        if data.transportationURl != nil {
            thumbnailImageView.image = UIImage(named: data.transportationIcon)
        } else {
            thumbnailImageView.image = UIImage(systemName: data.transportationIcon)
        }
    }
}
