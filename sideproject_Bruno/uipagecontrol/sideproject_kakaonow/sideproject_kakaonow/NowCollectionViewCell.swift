//
//  NowCollectionViewCell.swift
//  sideproject_kakaonow
//
//  Created by 서유준 on 2022/11/07.
//

import UIKit

class NowCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var thumnnailImageView: UIImageView!
    
    func configure(_ now: NowModel) {
        thumnnailImageView.image = UIImage(named: now.imageName)
    }
}
