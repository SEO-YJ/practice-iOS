//
//  ChattingCollectionViewCell.swift
//  sideproject_kakaotabbar
//
//  Created by 서유준 on 2022/11/04.
//

import UIKit

class ChattingCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var iconImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var chatLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var chatCountLabel: UILabel!
    @IBOutlet weak var alarmImageView: UIImageView!
    @IBOutlet weak var chatCountImageView: UIImageView!
    
    func configure(_ chat: ChattingModel) {
        iconImageView.image = UIImage(systemName: chat.icon)
        nameLabel.text = chat.name
        chatLabel.text = chat.chat
        
        if chat.alarm == nil {
            alarmImageView.image = nil
        } else {
            alarmImageView.image = UIImage(systemName: chat.alarm!)
        }
        
        dateLabel.text = chat.date
        
        if chat.chatCount == nil {
            chatCountLabel.text = nil
            chatCountImageView.image = nil
        } else {
            chatCountLabel.text = overChat(chat.chatCount!)
        }
    }
    
    func overChat(_ chatNum: Int) -> String {
        if chatNum > 300 {
            return "300+"
        }
        return "\(chatNum)"
    }
}
