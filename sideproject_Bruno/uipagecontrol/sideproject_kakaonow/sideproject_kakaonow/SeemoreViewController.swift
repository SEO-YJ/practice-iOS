//
//  SeemoreViewController.swift
//  sideproject_kakaotabbar
//
//  Created by 서유준 on 2022/11/04.
//

import UIKit

class SeemoreViewController: UIViewController {

    @IBOutlet weak var collectionViewSeemore: UICollectionView!
    
    @IBOutlet weak var collectionViewNow: UICollectionView!
    
    @IBOutlet weak var pageControlNow: UIPageControl!
    
    @IBOutlet weak var locationLabel: UILabel!
    
    @IBOutlet weak var weatherImageView: UIImageView!
    
    @IBOutlet weak var temparatureLabel: UILabel!
    
    @IBOutlet weak var compareTemparatureLabel: UILabel!
    
    @IBOutlet weak var fineDustConcentrationLabel: UILabel!
    
    let seemoreList: [SeemoreModel] = SeemoreModel.list
    
    let nowList: [NowModel] = NowModel.list
    
    let weatherList: [WeatherModel] = WeatherModel.list
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionViewSeemore.dataSource = self
        collectionViewSeemore.delegate = self
        
        collectionViewNow.dataSource = self
        collectionViewNow.delegate = self
        
        // collectionView의 content inset
        collectionViewSeemore.contentInset = UIEdgeInsets(top: 20, left: 30, bottom: 20, right: 30)
        if let flowlayout = collectionViewSeemore.collectionViewLayout as? UICollectionViewFlowLayout {
            flowlayout.estimatedItemSize = .zero
        }
        
        if let flowlayoutNow = collectionViewNow.collectionViewLayout as? UICollectionViewFlowLayout {
            flowlayoutNow.estimatedItemSize = .zero
        }
        
        pageControlNow.numberOfPages = nowList.count
    }
    @IBAction func tappedLocationButton(_ sender: Any) {
        let randomCity = weatherList.randomElement()!
        locationLabel.text = randomCity.location
        
        switch randomCity.location {
        case "도봉구":
            weatherImageView.image = UIImage(systemName: randomCity.weatherImage)?.withRenderingMode(.alwaysOriginal)
        case "강북구":
            weatherImageView.image = UIImage(systemName: randomCity.weatherImage)?.withRenderingMode(.alwaysOriginal)
        case "강동구":
            weatherImageView.image = UIImage(systemName: randomCity.weatherImage)?.withRenderingMode(.alwaysOriginal)
        case "송파구":
            weatherImageView.image = UIImage(systemName: randomCity.weatherImage)?.withRenderingMode(.alwaysOriginal)
        case "종로구":
            weatherImageView.image = UIImage(systemName: randomCity.weatherImage)?.withRenderingMode(.alwaysTemplate)
        case "성북구":
            weatherImageView.image = UIImage(systemName: randomCity.weatherImage)?.withRenderingMode(.alwaysTemplate)
        case "강남구":
            weatherImageView.image = UIImage(systemName: randomCity.weatherImage)?.withRenderingMode(.alwaysTemplate)
        case "노원구":
            weatherImageView.image = UIImage(systemName: randomCity.weatherImage)?.withRenderingMode(.alwaysTemplate)
        case "서초구":
            weatherImageView.image = UIImage(systemName: randomCity.weatherImage)?.withRenderingMode(.alwaysTemplate)
        default:
            weatherImageView.image = UIImage(systemName: randomCity.weatherImage)?.withRenderingMode(.alwaysTemplate)
        }

        temparatureLabel.text = randomCity.temperature
        compareTemparatureLabel.text = randomCity.compareTemparature
        fineDustConcentrationLabel.text = randomCity.fineDustConcentration
        if randomCity.fineDustConcentration == "좋음" {
            fineDustConcentrationLabel.textColor = UIColor.systemBlue
        } else if randomCity.fineDustConcentration == "보통" {
            fineDustConcentrationLabel.textColor = UIColor.systemGreen
        } else {
            fineDustConcentrationLabel.textColor = UIColor.systemRed
        }
    }
}

extension SeemoreViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView ==  collectionViewSeemore{
            return seemoreList.count
        }
        if collectionView == collectionViewNow {
            return nowList.count
        }
            return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == collectionViewSeemore {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SeemoreCollectionViewCell", for: indexPath) as? SeemoreCollectionViewCell else {
                return UICollectionViewCell()
            }
            let seemore = seemoreList[indexPath.item]
            cell.configure(seemore)
            return cell
        }
        
        if collectionView == collectionViewNow {
            guard let cellNow = collectionView.dequeueReusableCell(withReuseIdentifier: "NowCollectionViewCell", for: indexPath) as? NowCollectionViewCell else {
                return UICollectionViewCell()
            }
            let now = nowList[indexPath.item]
            cellNow.configure(now)
            return cellNow
        }
        return UICollectionViewCell()
    }
}

extension SeemoreViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if collectionView == collectionViewSeemore {
            let cellInterPadding: CGFloat = 40
            
            let padding: CGFloat = 30
        
            let width = ( collectionViewSeemore.bounds.width - cellInterPadding * 3 - padding * 2 ) / 4
            let height = width * 1.5
            
            return CGSize(width: width, height: height)
        }
        
        if collectionView == collectionViewNow {
            return collectionViewNow.bounds.size
        }
        return .zero
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        if collectionView == collectionViewSeemore {
            return 20
        }
        
        if collectionView == collectionViewNow {
            return .zero
        }
        return .zero
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        if collectionView == collectionViewSeemore {
            return 40
        }
        
        if collectionView == collectionViewNow {
            return .zero
        }
        return .zero
    }
}

extension SeemoreViewController: UIScrollViewDelegate {
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let index = Int(scrollView.contentOffset.x/self.collectionViewNow.bounds.width)
        pageControlNow.currentPage = index
    }
}
