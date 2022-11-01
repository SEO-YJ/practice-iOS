//
//  WeatherViewController.swift
//  apptool_uicollectionview
//
//  Created by 서유준 on 2022/10/23.
//

import UIKit

class WeatherViewController: UIViewController {
    // DataModel에 데이터를 할당한 상수를 ViewController에 선언 후 할당
    let weatherList: [DataModel] = DataModel.list
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        /*
         현재 ViewController를 CollectionView의 프로토콜로 확장하여,
         CollectionView를 구성하기 위해 필요한 코드를 작성하고,
         이 클래스를 Storyboard에 할당한 CollectionView의 dataSource, delegate에 넘겨줌.
         collectionView의 프로토콜이 무슨 규칙을 따라야 하는지 현재 ViewController가 알려준다.
         */
        
        collectionView.dataSource = self
        collectionView.delegate = self
        
    }
}

/*
 Storyboard에 넣은 collectionView를 사용하기 위해, 현재 ViewController에 CollectionView를 연결하였고,
 CollectionView를 구성하기 위해, CollectionView의 프로토콜을 현재 ViewController에 확장하였다.
 1. UICollectionViewDataSource: CollectionView의 데이터를 넘겨주기 위한 프로토콜
 2. UICollectionViewDelegateFlowLayout: CollectionVeiw의 레이아웃을 짜기 위한 프로토콜
 */

extension WeatherViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // CollectionView가 몇 개의 셀을 필요로 하냐?
        // 하나의 섹션 안에 몇개의 아이템을 사용할거야?
        return weatherList.count // 데이터의 갯수 만큼 사용할거야~
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        // Presentation: Cell을 어떻게 표현할 거냐?
        // collectionView에 등록된 것 중에 재사용가능한 셀을 가져오겠다.
        /*
         withReuseIdentifier: 재사용한 셀의 구분자
         for: 재사용할 셀을 가져왔는데 이게 몇 번째 셀로 사용할거냐?
         
         as?: 커스텀셀 타입으로 캐스팅해줘야 한다. 캐스팅 실패할 수 있으니 옵셔널
         guard let: 옵셔널 바인딩
         */
        
        // 1. 새로 만든 커스텀 셀의 코드파일 사용
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "WeatherCollectionViewCell", for: indexPath) as? WeatherCollectionViewCell else {
            return UICollectionViewCell()
        }
        
        // 2. 커스텀 셀에 해당하는 데이터를 준다.
        let weather = weatherList[indexPath.item]
        // 3. 커스텀 셀의 데이터를 업데이트 한다.
        cell.configure(weather)
        
        
        return cell
       // return UICollectionViewCell()
    }
    
    
 /*
  UICollectionViewDataSource를 확장하면,
  현재 ViewController가 CollectionView의 DataSource 프로토콜을 준수한다.
  
  DataSource
  1. Data: 어떤 데이터를 쓸거야?
  2. Presentation: 셀을 어떻게 표현할거야?
  
  collectionView에게 알려줘야하는 property, method 등이 protocol에 있다.
  실제로 collectionView가 어떻게 규칙을 따라야 하는지 알려주는 행위를 해야한다.
  ex> 어떤 property, 어떤 method 등을 따라야 한다.
  */
}

extension WeatherViewController: UICollectionViewDelegateFlowLayout {
    /*
     UICollectionViewDelegateFlowLayout을 확장하면,
     현재 ViewController가 CollectionView의 DelegateFlowLayout 프로토콜을 준수한다.
     
     DelegateFlowLayout
     1. Layout: 셀들을 어떻게 배치할거야?
     */
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        /*
         하나의 셀의 너비, 높이를 정해줘 셀을 배치한다.
         */
        return CGSize(width: collectionView.bounds.width, height: 100)
    }
}
