//
//  MovieReviewsPresenterClass.swift
//  MovieProject
//
//  Created by IbrahimDesouky72 on 4/29/18.
//  Copyright © 2018 IbrahimDesouky72. All rights reserved.
//

import Foundation
class MovieReviewsPresenterClass : MovieReviewsPresenterProtocol {
    var networkCalls : NetworkProtocol
    var movieReviewsProtocol : MovieReviewsProtocol
    init(with : MovieReviewsProtocol) {
        networkCalls = NetworkCalls()
        movieReviewsProtocol = with
    }
    
    func getAllReviews(movieId : Int32 ) {
        networkCalls.getMovieReviews(movieId: movieId, presenter: self)
    }
    
    func addReviewsToTableView(movieReviews:[MovieReviewsData]) {
        movieReviewsProtocol.updateReviewsCollectionView(reviews: movieReviews)
        
    }
    
}
