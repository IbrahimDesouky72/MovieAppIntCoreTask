//
//  MovieDetailsPresenterProtocol.swift
//  MovieProject
//
//  Created by IbrahimDesouky72 on 4/27/18.
//  Copyright © 2018 IbrahimDesouky72. All rights reserved.
//

import Foundation

protocol MovieDetailsPresenterPrtocol {
    func addMovieToCoreData(movie : MovieClass)
    func getMovieTrailers(id : Int32)
    func addTrailers(movieTrailers : [MovieTrailer])
    func isFavourite(movieTitle : String)
}
