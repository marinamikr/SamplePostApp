//
//  Post.swift
//  SampleChagApp
//
//  Created by 原田摩利奈 on 2019/02/05.
//  Copyright © 2019 原田摩利奈. All rights reserved.
//

import Foundation
class Post: NSObject {
    var text: String!
    var userName: String!
    
    init(text:String,userName:String) {
        self.text = text
        self.userName = userName
    }
}
