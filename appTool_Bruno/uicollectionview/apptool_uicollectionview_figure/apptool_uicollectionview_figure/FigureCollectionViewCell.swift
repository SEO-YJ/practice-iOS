//
//  FigureCollectionViewCell.swift
//  apptool_uicollectionview_self
//
//  Created by 서유준 on 2022/10/26.
//

import UIKit

class FigureCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var figureIconImageView: UIImageView!
    @IBOutlet weak var figureNameLabel: UILabel!
    
    func configure(_ figure: FigureModel) {
        figureIconImageView.image = UIImage(systemName: figure.figureIcon)
        figureNameLabel.text = figure.figureName
    }
}
