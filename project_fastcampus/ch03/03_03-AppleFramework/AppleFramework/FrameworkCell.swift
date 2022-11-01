//
//  FrameworkCell.swift
//  AppleFramework
//
//  Created by 서유준 on 2022/10/29.
//

import UIKit

class FrameworkCell: UICollectionViewCell {
    
    @IBOutlet weak var thumbnailImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Label의 text를 안 짤리게 하는 방법
        nameLabel.numberOfLines = 1 // Label의 text를 줄 1개로 표시
        nameLabel.adjustsFontSizeToFitWidth = true
    }
    
    func configure(_ framework: AppleFramework) {
        thumbnailImageView.image = UIImage(named: framework.imageName)
        nameLabel.text = framework.name
    }
}
