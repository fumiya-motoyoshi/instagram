//
//  PostTableViewCell.swift
//  Instagram
//
//  Created by Fumiya Motoyoshi on 2020/03/01.
//  Copyright © 2020 fumiya.motoyoshi. All rights reserved.
//

import UIKit

class PostTableViewCell: UITableViewCell {
    
    @IBOutlet weak var postImageView: UIImageView!
    @IBOutlet weak var likeButton: UIButton!
    @IBOutlet weak var likeLabel: UILabel!
    @IBOutlet weak var commentButton: UIButton! //追加
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var captionLabel: UILabel!
    @IBOutlet weak var commentLabel: UILabel! //追加
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setPostData(_ postData: PostData) {
        self.postImageView.image = postData.image
        
        self.captionLabel.text = "\(postData.name!) : \(postData.caption!)"
        let likeNumber = postData.likes.count
        likeLabel.text = "\(likeNumber)"
        
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm"
        let dateString = formatter.string(from: postData.date!)
        self.dateLabel.text = dateString
        
        if postData.isLiked {
            let buttonImage = UIImage(named: "like_exist")
            self.likeButton.setImage(buttonImage, for: .normal)
        } else {
            let buttonImage = UIImage(named: "like_none")
            self.likeButton.setImage(buttonImage, for: .normal)
        }
        
        //追加　ユーザ名とコメントをキャプションの下に表示
        //ユーザとコメントをひとつのまとまりとして管理する（:でまとめることが可能）
        //それらをひとつひとつ改行して表示 \nで設定可能
        //そのまとまり全部がひとつのLabelに入ってくるイメージ
        
        let line = "------------------------------------------\n"
        var displaycomment = ""
        
        //配列から情報を持ってくるときはFor文を活用する
        //配列一件一件が以下commentに入ってくるイメージ
        for comment in postData.comments {
            displaycomment = displaycomment + comment + "\n"
        }
        
        self.commentLabel.text = line + displaycomment
        
        
    }
    
}

