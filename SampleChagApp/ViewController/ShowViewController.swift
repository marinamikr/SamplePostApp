//
//  ShowViewController.swift
//  SampleChagApp
//
//  Created by 原田摩利奈 on 2019/01/29.
//  Copyright © 2019 原田摩利奈. All rights reserved.
//

import UIKit
import Firebase

class ShowViewController: UIViewController {
    // UserDefaults のインスタンス
    let userDefaults = UserDefaults.standard
    
    var userName: String!
    
    // インスタンス変数
    var DBRef:DatabaseReference!
    
    var postArray: [Post] = Array()
    
    @IBOutlet weak var showTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        showTableView.dataSource = self
        showTableView.delegate = self
        //Identifierを設定する
        self.showTableView.register(UINib(nibName: "CustomTableViewCell", bundle: nil), forCellReuseIdentifier: "customCell")
        
        DBRef = Database.database().reference()
        
        // Keyを指定して読み込み
        userName = userDefaults.object(forKey: "UserName") as! String
        
        DBRef.child(userName).observe(.value, with: { (snapshot) in
            
            for itemSnapShot in snapshot.children  {
                let snap = itemSnapShot as! DataSnapshot
                let data = snap.value as! [String : AnyObject]
                print(data["text"])
                var post: Post = Post(text: data["text"] as! String, userName: self.userName)
                self.postArray.append(post)
            }
            self.showTableView.reloadData()
        })
    }
    
    @IBAction func plusButton(_ sender: Any) {
        performSegue(withIdentifier: "toPostViewController",sender: nil)
    }
    
    
}


extension ShowViewController: UITableViewDataSource,UITableViewDelegate {
    
    //cellの数
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return postArray.count
    }
    
    //cellの内容
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = showTableView.dequeueReusableCell(withIdentifier: "customCell", for: indexPath) as! CustomTableViewCell
        cell.setContents(contents: postArray[indexPath.row].text)
        cell.setUserName(userName: postArray[indexPath.row].userName)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
}
