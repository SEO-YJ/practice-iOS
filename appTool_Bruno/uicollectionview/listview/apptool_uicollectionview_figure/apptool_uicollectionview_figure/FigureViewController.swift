//
//  FigureViewController.swift
//  apptool_uicollectionview_self
//
//  Created by 서유준 on 2022/10/26.
//

import UIKit

class FigureViewController: UIViewController {
    //1. collectionview 아울렛 변수 연결
    @IBOutlet weak var collectionView: UICollectionView!
    //2. DataModel의 리스트 값 할당
    let figureList: [FigureModel] = FigureModel.list
    
    override func viewDidLoad() {
        super.viewDidLoad()
    //3. collectionView에게 현재 ViewController에서 확장한 규칙을 전달
        collectionView.dataSource = self
        collectionView.delegate = self
    }
    
}

extension FigureViewController: UICollectionViewDataSource {
    
    /*
     1. Data: 어떠한 데이터를 사용할 것인가?
     2. Presentation: 셀을 어떻게 표현할 것인가?
     
     */
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // 1. Data: 몇 개의 셀을 반환할 것인가?
        // DataModel의 셀의 갯수 만큼 반환
        return figureList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        // 2. Presentation: 셀을 어떻게 표현할 것인가?
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "FigureCollectionViewCell", for: indexPath) as? FigureCollectionViewCell else {
            return UICollectionViewCell()
        }
        
        // 이 부분 안 해주면 셀의 데이터가 업데이트 되지 않고, 리스트의 첫 번째 데이터만 반복해서 출력된다.
        //  1. 커스텀 셀에 해당하는 데이터를 제공한다.
        let figure = figureList[indexPath.item]
        // 2. 커스텀 셀에 해당하는 데이터를 업데이트 한다.
        cell.configure(figure)
        
        return cell
    }
}

extension FigureViewController: UICollectionViewDelegateFlowLayout {
    /*
     1. Layout: 셀들을 어떻게 배치할 것인가?
     */
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.bounds.width, height: 100)
    }
}
