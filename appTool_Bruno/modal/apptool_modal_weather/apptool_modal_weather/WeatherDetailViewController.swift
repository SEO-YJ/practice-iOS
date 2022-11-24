//
//  WeatherDetailViewController.swift
//  apptool_modal_weather
//
//  Created by 서유준 on 2022/11/21.
//

import UIKit
import SafariServices

class WeatherDetailViewController: UIViewController {

    @IBOutlet weak var thumbnail: UIImageView!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    var data: Weather = Weather(title: "", description: "", imageName: "", weatherUrl: "")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }
    func updateUI() {
        thumbnail.image = UIImage(named: data.imageName)
        descriptionLabel.text = data.description
    }
    
    @IBAction func openSafari(_ sender: Any) {
        guard let url = URL(string: data.weatherUrl!) else {
            return
        }
        let safari = SFSafariViewController(url: url)
        present(safari, animated: true)
    }
}
