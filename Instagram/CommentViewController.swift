//
//  CommentViewController.swift
//  Instagram
//
//  Created by Fumiya Motoyoshi on 2020/03/02.
//  Copyright © 2020 fumiya.motoyoshi. All rights reserved.
//

import UIKit
import Firebase
import SVProgressHUD

class CommentViewController: UIViewController {
    
    @IBOutlet weak var textField: UITextField!

    
    //初期にnilでpostDataが
    //!オプショナル型の指定＝何か値が入ってくるもの
    var postData:PostData!
    
    // 投稿ボタンをタップしたときに呼ばれるメソッド
    @IBAction func handlePostButton(_ sender: Any) {
        
        //どの投稿データに保存するか判別するために、indexPathで取得したpostDataを受け取る
        
        
        //ユーザIDを取得する
        let name = Auth.auth().currentUser?.displayName
        
        //コメントを準備
        let comment = textField.text
        
        //ユーザIDとコメントを合体
        let namecomment = name! + ">" + comment!
        
        //そのpostData内のcommentsデータに、コメントとして投稿する内容(textFieldに入力された文字)をappendする
        //postDataから既存のコメントを取得する+appendする
        postData.comments.append(namecomment)
        
        //Firebaseに保存する
        let postRef = Database.database().reference().child(Const.PostPath).child(postData.id!)
        let comments = ["comments": postData.comments]
        postRef.updateChildValues(comments)
        
        
        // HUDで投稿完了を表示する
        SVProgressHUD.showSuccess(withStatus: "投稿しました")
        
        // 全てのモーダルを閉じる
        UIApplication.shared.keyWindow?.rootViewController?.dismiss(animated: true, completion: nil)
    }
    
    // キャンセルボタンをタップしたときに呼ばれるメソッド
    @IBAction func handleCancelButton(_ sender: Any) {
        // 画面を閉じる
        dismiss(animated: true, completion: nil)
    }


    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

}
