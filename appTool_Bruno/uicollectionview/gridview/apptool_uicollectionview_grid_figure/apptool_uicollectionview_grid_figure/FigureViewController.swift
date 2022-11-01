//
//  FigureViewController.swift
//  apptool_uicollectionview_grid_figure
//
//  Created by 서유준 on 2022/11/01.
//

import UIKit

class FigureViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    let list: [FigureModel] = FigureModel.list
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.dataSource = self
        collectionView.delegate = self
        
        // 컬렉션 뷰 컨텐츠의 padding 설정 방법
        collectionView.contentInset = UIEdgeInsets(top: 20, left: 16, bottom: 0, right: 16)
    }
}

extension FigureViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return list.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "FigureCollectionViewCell", for: indexPath) as? FigureCollectionViewCell else {
            return UICollectionViewCell()
        }
        let figure = list[indexPath.item]
        cell.configure(figure)
        
        return cell
    }
}

extension FigureViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        // 그리드뷰 만드는 법
        
        // 행 위에 있는 각 셀들의 여백을 상수로 할당한다.
        let interItemSpacing: CGFloat = 10
        // Contents View의 여백을 상수로 할당한다.
        let padding: CGFloat = 16
        
        // 셀 하나의 너비값을 할당한다.
        let width = (collectionView.bounds.width - interItemSpacing * 2 - padding * 2) / 3
        
        // 셀 하나의 높이값을 할당한다.
        // Collection View의 ImageView를 Aspect Ratio 사용시 height를 width와 관련하여 값을 할당해야 한다.
        let height = width * 1.5
        
        // 셀의 하나의 너비, 높이 값을 반환한다.
        return CGSize(width: width, height: height)
    }
    
    // cell 들 간의 수평 공백을 명시적으로 정해주는 함수
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
    
    // cell 들 간의 수직 공백을 명시적으로 정해주는 함수
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
}
