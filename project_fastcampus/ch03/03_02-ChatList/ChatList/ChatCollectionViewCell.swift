//
//  ChatCollectionViewCell.swift
//  ChatList
//
//  Created by 서유준 on 2022/10/26.
//

import UIKit

class ChatCollectionViewCell: UICollectionViewCell {
    // 데이터를 업데이트 해줘야 하기에, 특정 데이터를 받아서 업데이트 하기 위함
    @IBOutlet weak var thumbnail: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var chatLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    
    // awakeFromNib: Storyboard에서 Cell을 꺼내올 때 처음 호출 되는 함수
    override func awakeFromNib() {
        super.awakeFromNib()
        // 셀의 이미지 꼭짓점을 뭉뚝하게 만들어주는 함수를 구현해보자.
        thumbnail.layer.cornerRadius = 10
    }
    
    // 셀의 컴포넌트를 데이터에 따라 업데이트 해주는 함수
    func configure(_ chat: Chat) {
        thumbnail.image = UIImage(named: chat.name)
        nameLabel.text = chat.name
        chatLabel.text = chat.chat
        dateLabel.text = formattedDateString(dateString: chat.date)
    }
    
    func formattedDateString(dateString: String) -> String {
        /*
         String -> Date -> String
         ios Date Formatter 이용
         년-월-일 -> 월-일
         ex> 2022-04-01 -> 4/1
         */
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        
        /*
         문자열을 Date 타입으로
         Date 타입을 가지고 있으면, 어떠한 Date 형태로도 변환할 수 있다.
         */
        if let date = formatter.date(from: dateString) {
            formatter.dateFormat = "M/d"
            return formatter.string(from: date)
        } else {
            return ""
        }
    }
}
