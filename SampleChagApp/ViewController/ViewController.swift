//
//  ViewController.swift
//  SampleChagApp
//
//  Created by 原田摩利奈 on 2019/01/29.
//  Copyright © 2019 原田摩利奈. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var userNameTextField: UITextField!
    
    @IBAction func okButton(_ sender: Any) {
        userDefaults.set(userNameTextField.text, forKey: "UserName")
        userDefaults.synchronize()
        performSegue(withIdentifier: "toShowViewController",sender: nil)
    }
    
    // UserDefaults のインスタンス
    let userDefaults = UserDefaults.standard
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        // textFiel の情報を受け取るための delegate を設定
        userNameTextField.delegate = self as! UITextFieldDelegate
        
    }
}

extension ViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool{
        
        // キーボードを閉じる
        textField.resignFirstResponder()
        
        return true
    }
    
}

