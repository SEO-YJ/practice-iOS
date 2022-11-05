//
//  SeemoreCollectionViewCell.swift
//  sideproject_kakaoseemorelist
//
//  Created by 서유준 on 2022/11/01.
//

import UIKit

class SeemoreCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var iconImageImageView: UIImageView!
    @IBOutlet weak var iconNameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        iconNameLabel.numberOfLines = 1
        iconNameLabel.adjustsFontSizeToFitWidth = true
    }
    
    func configure(_ data: DataModel) {
        iconImageImageView.image = UIImage(systemName: data.iconImage)
        iconNameLabel.text = data.iconName
    }
}
