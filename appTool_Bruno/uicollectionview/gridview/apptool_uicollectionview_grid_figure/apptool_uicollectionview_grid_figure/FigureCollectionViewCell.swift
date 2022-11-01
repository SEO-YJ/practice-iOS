//
//  FigureCollectionViewCell.swift
//  apptool_uicollectionview_grid_figure
//
//  Created by 서유준 on 2022/11/01.
//

import UIKit

class FigureCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var figureIconImageView: UIImageView!
    @IBOutlet weak var figureNameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Label의 좌, 위의 AutoLayout은 걸어져 있어야 한다.
        // 좌에 AutoLayout 안 걸고 했더니, 작아지지 않았다.
        figureNameLabel.numberOfLines = 1
        figureNameLabel.adjustsFontSizeToFitWidth = true 
    }
    
    func configure(_ figure: FigureModel) {
        figureIconImageView.image = UIImage(systemName: figure.figureIcon)
        figureNameLabel.text = figure.figureName
    }
}
