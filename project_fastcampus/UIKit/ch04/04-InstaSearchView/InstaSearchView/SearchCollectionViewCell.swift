//
//  SearchCollectionViewCell.swift
//  InstaSearchView
//
//  Created by 서유준 on 2022/11/02.
//

import UIKit

class SearchCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var imageIconImageView: UIImageView!
    
    // Cell이 재사용 되기전에 준비하는 메소드
    override func prepareForReuse() {
        super.prepareForReuse()
        // 기존의 이미지 Reset
        imageIconImageView.image = nil
        
    }
    
    func configure(_ search: SearchModel) {
        imageIconImageView.image = UIImage(named: search.imageIcon)
    }
}
