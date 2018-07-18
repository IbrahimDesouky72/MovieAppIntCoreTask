//
//  MovieTrailer.swift
//  MovieProject
//
//  Created by IbrahimDesouky72 on 4/29/18.
//  Copyright © 2018 IbrahimDesouky72. All rights reserved.
//

import Foundation
class MovieTrailer :Decodable{
    var key : String
    var name : String
    
    init() {
        key = ""
        name = ""
    }
}

class TrailerResults: Decodable {

    var results : [MovieTrailer]
    
    init() {
        
        results = [MovieTrailer]()
    }
}
