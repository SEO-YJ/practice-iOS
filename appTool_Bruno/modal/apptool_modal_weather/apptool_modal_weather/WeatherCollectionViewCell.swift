//
//  WeatherCollectionViewCell.swift
//  apptool_modal_weather
//
//  Created by 서유준 on 2022/11/21.
//

import UIKit

class WeatherCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var thumbNailLabel: UIImageView!
    
    func configure(_ weather: Weather) {
        titleLabel.text = weather.title
        descriptionLabel.text = weather.description
        
        if (weather.imageName == "nationalWeather") || (weather.imageName == "accuWeather") || (weather.imageName == "weatherNews") || (weather.imageName == "weatherChannel") {
            thumbNailLabel.image = UIImage(named: weather.imageName)
        }
        else if (weather.imageName == "sun.max.fill") || (weather.imageName == "snow") || (weather.imageName == "wind") {
            thumbNailLabel.image = UIImage(systemName: weather.imageName)?.withRenderingMode(.alwaysOriginal)
        } else {
            thumbNailLabel.image = UIImage(systemName: weather.imageName)?.withRenderingMode(.alwaysTemplate)
        }
    }
}
