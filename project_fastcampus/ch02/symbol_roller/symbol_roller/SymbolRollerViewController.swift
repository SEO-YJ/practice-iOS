//
//  SymbolRollerViewController.swift
//  symbol_roller
//
//  Created by 서유준 on 2022/10/10.
//

import UIKit

class SymbolRollerViewController: UIViewController {

    let symbols: [String] = ["sun.min", "moon", "cloud", "wind", "snowflake"]
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var button: UIButton!
    
    func reload() {
        let symbol = symbols.randomElement()!
        
        imageView.image = UIImage(systemName: symbol)
        label.text = symbol
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        reload()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    @IBAction func buttonTapped(_ sender: Any) {
        //MARK: - 내가 작성한 기능
        /*
        let reload = symbols.randomElement()!
         // 배열에서 랜덤한 값 추출해서 상수에 저장
        imageView.image = UIImage(systemName: reload)
        label.text = reload
         // IBOutlet으로 연결한 imageView와 Label의 그림과 텍스트에 랜덤 값 할당
        */
        
        //MARK: - 강사님 작성한 기능
        // viewDidload 함수에서 처음 이미지 정의
        reload()
    }
}
