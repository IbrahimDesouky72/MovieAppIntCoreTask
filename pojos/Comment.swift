//
//  Comment.swift
//  MovieProject
//
//  Created by Ahmed Mokhtar on 7/20/18.
//  Copyright © 2018 IbrahimDesouky72. All rights reserved.
//

import Foundation
class Comment :Decodable {
    
    var postId : Int
    var id : Int
    var name : String
    var email : String
    var body : String
    
    init() {
        postId = 0
        id = 0
        name = ""
        email = ""
        body = ""
        
    }
}
