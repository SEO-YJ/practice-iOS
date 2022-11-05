//
//  SeemoreCollectionViewCell.swift
//  sideproject_kakaotabbar
//
//  Created by 서유준 on 2022/11/05.
//

import UIKit

class SeemoreCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var iconImageView: UIImageView!
    
    @IBOutlet weak var iconLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        iconLabel.numberOfLines = 1
        iconLabel.adjustsFontSizeToFitWidth = true
    }
    
    func configure(_ data: SeemoreModel) {
        iconImageView.image = UIImage(systemName: data.iconImage)
        iconLabel.text = data.iconName
    }
}
