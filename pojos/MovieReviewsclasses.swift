//
//  MovieReviewsclasses.swift
//  MovieProject
//
//  Created by IbrahimDesouky72 on 4/29/18.
//  Copyright © 2018 IbrahimDesouky72. All rights reserved.
//

import Foundation
class MovieReviewsResults : Decodable {
    var results : [MovieReviewsData]
    init() {
        results = [MovieReviewsData]()
    }
}

class MovieReviewsData: Decodable {
    var author : String
    var content : String
    
    init() {
        author = ""
        content = ""
    }
}
