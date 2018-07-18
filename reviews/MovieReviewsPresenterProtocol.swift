//
//  MovieReviewsPresenterProtocol.swift
//  MovieProject
//
//  Created by IbrahimDesouky72 on 4/29/18.
//  Copyright © 2018 IbrahimDesouky72. All rights reserved.
//

import Foundation
protocol MovieReviewsPresenterProtocol {
    func getAllReviews(movieId : Int32 )
    func addReviewsToTableView(movieReviews:[MovieReviewsData])
}
