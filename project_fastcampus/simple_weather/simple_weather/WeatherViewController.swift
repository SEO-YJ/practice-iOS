//
//  WeatherViewController.swift
//  simple_weather
//
//  Created by 서유준 on 2022/10/17.
//

import UIKit

class WeatherViewController: UIViewController {
    let cityArr = ["seoul", "tokyo", "seatle"]
    let cityDic = ["seoul": ["10°", "20°", "30°"], "tokyo": ["11°", "22°", "33°"], "seatle": ["15°", "25°", "35°"]]
    
    @IBOutlet weak var cityLabel: UILabel!
    
    @IBOutlet weak var weatherImageView: UIImageView!
    
    @IBOutlet weak var temparatureLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
  
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    
    }
    
    let cities = ["Seoul", "Tokyo", "LA", "Seattle"]
    let weathers = ["cloud.fill", "sun.max.fill", "wind", "cloud.sun.rain.fill"]
    
    @IBAction func changeButtonTapped(_ sender: Any) {
        /*
         내가 미리 작성한 코드
        let selectCity = cityArr.randomElement()! // 랜덤 도시
        let selectCityTem = cityDic[selectCity]![0]
        
        cityName.text = selectCity
        cityTemparature.text = selectCityTem
    
        
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 2) {
            self.cityTemparature.text  = String(self.cityDic[selectCity]![1])
        }
        
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 4) {
            self.cityTemparature.text  = String(self.cityDic[selectCity]![2])
        }
         */
        
        // 강사님 작성 코드
        cityLabel.text = cities.randomElement()
        
        let imageName = weathers.randomElement()!
        weatherImageView.image = UIImage(systemName: imageName)?.withRenderingMode(.alwaysOriginal)
        
        let randomTemp = Int.random(in: 10..<30)
        temparatureLabel.text = "\(randomTemp)°"
    }
    
}
