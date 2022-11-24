//
//  TransportationUrlViewController.swift
//  apptool_modal_transportation
//
//  Created by 서유준 on 2022/11/24.
//

import UIKit
import SafariServices

class TransportationUrlViewController: UIViewController {
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var thumbnail: UIImageView!
    @IBOutlet weak var urlButton: UIButton!
    var data: TransportationModel = TransportationModel(transportationIcon: "", transportationName: "", transportationURl: "")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
        
    }
    func updateUI() {
        titleLabel.text = data.transportationName
        thumbnail.image = UIImage(named: data.transportationIcon)
    }
    @IBAction func tappedSafariButton(_ sender: Any) {
        guard let url = URL(string: data.transportationURl!) else {
            return
        }
        let vc = SFSafariViewController(url: url)
        present(vc, animated: true)
    }
}
