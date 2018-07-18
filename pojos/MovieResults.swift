//
//  File.swift
//  MovieProject
//
//  Created by IbrahimDesouky72 on 4/17/18.
//  Copyright © 2018 IbrahimDesouky72. All rights reserved.
//

import Foundation
import Alamofire



class MovieResults:Decodable{
    
    let results:[MovieClass]
    
    init() {
        
        results = [MovieClass]()
        
    }
}
