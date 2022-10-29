//
//  ChatViewController.swift
//  ChatList
//
//  Created by 서유준 on 2022/10/26.
//

import UIKit

class ChatViewController: UIViewController {
    // 컬렉션뷰에 따라 내용 업데이트
    @IBOutlet weak var collectionView: UICollectionView!
    
    var chatList: [Chat] = Chat.list
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Data, Presentation을 담당하는 것을 위임
        collectionView.dataSource = self
        collectionView.delegate = self
        
        // 배열의 멤버를 내림차순으로 정렬하는 방법
        chatList = chatList.sorted(by: { chat1, chat2 in
            return chat1.date > chat2.date
        })
    }
    

}

extension ChatViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        //CollectionView에 표현되는 아이템 갯수는 몇개야?
        return chatList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        //Presentation: 셀을 어떻게 표현할지 정의해서 알려줘야해
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ChatCollectionViewCell", for: indexPath) as? ChatCollectionViewCell else {
            return UICollectionViewCell()
        }
        let chat = chatList[indexPath.item]
        
        cell.configure(chat)
        
        return cell
    }
}

extension ChatViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.bounds.width, height: 100)
    }
}
