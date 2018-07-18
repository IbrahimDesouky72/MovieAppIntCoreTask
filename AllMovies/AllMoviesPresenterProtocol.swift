//
//  AllMoviesPresenterProtocol.swift
//  MovieProject
//
//  Created by IbrahimDesouky72 on 4/18/18.
//  Copyright © 2018 IbrahimDesouky72. All rights reserved.
//

import Foundation

protocol AllMoviesPresenterProtocol{
    func getAllMovies(movieType : Int)
    func moviesCallBack(movies : [MovieClass])
    func pushToDetailsViewController(movie : MovieClass)
    
}
