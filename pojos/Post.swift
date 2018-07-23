//
//  Post.swift
//  MovieProject
//
//  Created by Ahmed Mokhtar on 7/20/18.
//  Copyright © 2018 IbrahimDesouky72. All rights reserved.
//

import Foundation

class Post : Decodable {
    var userId : Int
    var id : Int
    var title : String
    var body :String
    lazy var comments = [Comment]()
    init() {
        userId = 0
        id = 0
        title = ""
        body = ""
    }
    
}
