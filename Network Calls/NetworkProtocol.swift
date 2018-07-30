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
    func getPosts(url : String , postsPresenter : PostsAndCommentsPresenterProtocol) -> [Post];
    func getComments(url :String , postsPresenter: PostsAndCommentsPresenterProtocol) -> [Comment]
    
}
