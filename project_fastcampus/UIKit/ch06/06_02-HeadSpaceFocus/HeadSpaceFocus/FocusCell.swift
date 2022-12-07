//
//  FocusCell.swift
//  HeadSpaceFocus
//
//  Created by 서유준 on 2022/11/14.
//

import UIKit

class FocusCell: UICollectionViewCell {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var thumbnail: UIImageView!
    
    // Cell의 파일이 Storyboard에서 깨어났을 때
    override func awakeFromNib() {
        super.awakeFromNib()
        contentView.backgroundColor = UIColor.systemIndigo
        contentView.layer.cornerRadius = 10
    }
    
    func configure(_ item: Focus) {
        titleLabel.text = item.title
        descriptionLabel.text = item.description
        thumbnail.image = UIImage(systemName: item.imageName)?.withRenderingMode(.alwaysOriginal)
    }
}
