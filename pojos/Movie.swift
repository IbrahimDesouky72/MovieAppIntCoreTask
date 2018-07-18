//
//  Movie.swift
//  MovieProject
//
//  Created by IbrahimDesouky72 on 4/17/18.
//  Copyright © 2018 IbrahimDesouky72. All rights reserved.
//

import Foundation



class MovieClass : Decodable{
    var id:Int32
   
    
    var poster_path:String
    
    var overview:String
    
    var release_date:String
    
    var vote_average:Float
    
    var backdrop_path:String?
    var original_title : String
    
    
    
    
    
    init() {
        
        id = 0
       
        
        poster_path = ""
        
        overview = ""
        
        release_date = ""
        
        vote_average = 0.0
        backdrop_path=""
        
        original_title = ""
       
        
        
        
        
    }
    
}
