//
//  ChatListCollectionViewCell.swift
//  apptool_uicollectionview_kakaochatinglist
//
//  Created by 서유준 on 2022/10/28.
//

import UIKit

class ChatListCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var iconImageView: UIImageView!
    
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var chatLabel: UILabel!
    
    @IBOutlet weak var alarmImageView: UIImageView!
    
    @IBOutlet weak var dateLabel: UILabel!

    @IBOutlet weak var chatCountLabel: UILabel!
    
    @IBOutlet weak var chatCountImageView: UIImageView!
    
    func configure(_ chat: DataModel) {
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
