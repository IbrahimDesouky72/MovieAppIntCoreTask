//
//  FavoriteMoviesPresenterClass.swift
//  MovieProject
//
//  Created by IbrahimDesouky72 on 4/27/18.
//  Copyright © 2018 IbrahimDesouky72. All rights reserved.
//

import Foundation
class FavoriteMoviesPresenterClass: FavoriteMoviesPresenterProtocol {
    let favoriteMoviesProtocol : FavoriteMoviesProtocol
    let networkCalls : NetworkProtocol
    
    init(with : FavoriteMoviesProtocol) {
        favoriteMoviesProtocol = with
        networkCalls = NetworkCalls()
    }
    
    func getFavoritesMovies() -> [MovieClass] {
        let favoriteMovies = networkCalls.fetchData()
        print(favoriteMovies.count)
        return favoriteMovies
        
    }
    
    
    
}
