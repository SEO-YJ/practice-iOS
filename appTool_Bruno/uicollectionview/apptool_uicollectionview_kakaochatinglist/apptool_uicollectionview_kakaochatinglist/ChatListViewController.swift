//
//  ChatListViewController.swift
//  apptool_uicollectionview_kakaochatinglist
//
//  Created by 서유준 on 2022/10/28.
//

import UIKit

class ChatListViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    
    let chatList: [DataModel] = DataModel.list
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        collectionView.dataSource = self
        collectionView.delegate = self
    }
}

extension ChatListViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return chatList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ChatListCollectionViewCell", for: indexPath) as? ChatListCollectionViewCell else {
            return UICollectionViewCell()
        }
        let chat = chatList[indexPath.item]
        cell.configure(chat)
        
        return cell
    }
}

extension ChatListViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.bounds.width, height: 80)
    }
}
