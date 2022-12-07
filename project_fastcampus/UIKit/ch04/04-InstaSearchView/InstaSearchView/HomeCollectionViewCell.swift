//
//  HomeCollectionViewCell.swift
//  InstaSearchView
//
//  Created by 서유준 on 2022/11/02.
//

import UIKit

class HomeCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var iconImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var contentImageView: UIImageView!
    
    override func prepareForReuse() {
        super.prepareForReuse()
        iconImageView.image = nil
        nameLabel.text = nil
        contentImageView.image = nil
    }
    
    func configure(_ contentImage: String) {
        iconImageView.image = UIImage(systemName: "pawprint.circle.fill")
        nameLabel.text = "National Geographic"
        contentImageView.image = UIImage(named: contentImage)
    }
}
