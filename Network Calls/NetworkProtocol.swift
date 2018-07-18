//
//  NetworkProtocol.swift
//  MovieProject
//
//  Created by IbrahimDesouky72 on 4/18/18.
//  Copyright © 2018 IbrahimDesouky72. All rights reserved.
//

import Foundation

protocol NetworkProtocol {
    func getMovies(type : Int , presenter : AllMoviesPresenterProtocol)
    func addMovie(coreDataMovie : MovieClass)
    func fetchData() ->[MovieClass]
    func fetchRecord(name : String) -> Bool
    func resetAllRecords(in entity : String)
    func getMovieTrailer(movieId : Int32 ,presenter : MovieDetailsPresenterPrtocol)
    func getMovieReviews(movieId : Int32 , presenter : MovieReviewsPresenterProtocol)
     func deleteRecord(movieName : String) -> Bool
    
}
