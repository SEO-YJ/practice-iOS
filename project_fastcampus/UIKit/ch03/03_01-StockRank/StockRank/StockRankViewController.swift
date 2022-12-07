//
//  StockRankViewController.swift
//  StockRank
//
//  Created by 서유준 on 2022/10/20.
//

import UIKit

class StockRankViewController: UIViewController {
    

    let stockList: [StockModel] = StockModel.list
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    //Collection View로 리스트뷰 만들시 고려할 사항
    /*
     1. Data: 어떠한 데이터 쓸거야? -> stockList
     2. Presentation: 셀을 어떻게 표현할거야?
     3. Layout: 셀을 어떻게 배치할거야?
     */
    
    //protocol - 규칙
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.dataSource = self
        collectionView.delegate = self
        
    }
    
}

extension StockRankViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // Purpose: 컬렉션 뷰에게 몇 개의 셀이 필요하냐?
        
        // 하나의 섹션 안에 몇개의 아이템을 사용할거야?
        
        return stockList.count // 데이터의 갯수 만큼 사용할거야~
        
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        // Purpose: 각 셀을 어떻게 표현할거냐?
        // Presentation: 셀을 어떻게 표현할거야? 에 대한 메소드
        // 이 메소드는 셀을 표현하고자 한다.
        
        // cellForItemAt indexPath: IndexPath  몇 번째에 해당하는 셀을 표현할지 결정
        
        
        // 1. 우리가 새로만든 커스텀 셀을 이용한다.
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "StockRankCollectionViewCell", for: indexPath) as? StockRankCollectionViewCell else {
            return UICollectionViewCell()
        }
        // as: ? 붙여준 이유는 타입 캐스팅을 실패할 수 있어서
        // guard ... else : 타입 캐스팅을 실패할 수 있어, 옵셔널 타입이므로, 옵셔널 바인딩을 진행한다.
        // StockRankCollectionViewCell로 타입 캐스팅 되면 아래 코드르 실행하고, 실패하면 UICollectionViewCell을 반환한다.
        
        /*
         guard < 꼭 참이어야 하는 조건> else {
         return ...
         }
         // 참일 경우 아래 코드 실행
         ...
         */
        
        /*
         casting
         Bruno: 남자 사람
         남자: 사람 (상속받음)
         
         let joon = Namja() // 남자 이면서 사람
         let joon = Saram() // 사람인 건 아나 남자인지 궁금
         
         joon as? Namja
         
         guard let nam = joon as? Namja else {
         return
         }
         send 군대
         
         */
        
        
        
        // 2. 커스텀 셀에 해당하는 데이터를 준다.
        let stock = stockList[indexPath.item]
        // 3. 커스텀 셀의 데이터를 업데이트 한다.
        cell.configure(stock)
        
        
        return cell
       // return UICollectionViewCell()
    }
    
    
}

extension StockRankViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        // width = collectionView
        // height = 80
        
        return CGSize(width: collectionView.bounds.width, height: 80)
    }
}
