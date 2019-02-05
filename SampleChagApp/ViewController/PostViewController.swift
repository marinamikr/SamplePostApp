//
//  PostViewController.swift
//  SampleChagApp
//
//  Created by 原田摩利奈 on 2019/01/29.
//  Copyright © 2019 原田摩利奈. All rights reserved.
//

import UIKit
import Firebase

class PostViewController: UIViewController {
    
    // UserDefaults のインスタンス
    let userDefaults = UserDefaults.standard

    @IBOutlet weak var saveTextView: UITextView!
    
    var userName: String!
    
    // インスタンス変数
    var DBRef:DatabaseReference!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
         //firebaseの初期化
        DBRef = Database.database().reference()
       
        // Keyを指定して読み込み
        userName = userDefaults.object(forKey: "UserName") as! String
    }
    
    @IBAction func postButton(_ sender: Any) {
        
        DBRef.child(userName).childByAutoId().child("text").setValue(saveTextView.text)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
