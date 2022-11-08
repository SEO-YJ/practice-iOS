//
//  FigureCollectionViewCell.swift
//  apptool_pagecontrol_figure
//
//  Created by 서유준 on 2022/11/07.
//

import UIKit

class FigureCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var thumbnail: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    
    func configure(_ data: FigureModel) {
        thumbnail.image = UIImage(systemName: data.figureIcon)
        nameLabel.text = data.figureName
    }
}
