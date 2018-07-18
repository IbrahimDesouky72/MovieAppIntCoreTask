//
//  MovieDetailsPresenterClass.swift
//  MovieProject
//
//  Created by IbrahimDesouky72 on 4/27/18.
//  Copyright © 2018 IbrahimDesouky72. All rights reserved.
//

import Foundation

class MovieDetailsPresenterClass: MovieDetailsPresenterPrtocol {
    
    let networkProtocol : NetworkProtocol
    let movieDetailsPrtocol : MovieDetailsPrtocol 
    
    
    init(with : MovieDetailsPrtocol){
        networkProtocol = NetworkCalls()
        movieDetailsPrtocol = with
        
        
    }
    func isFavourite(movieTitle : String)  {
        let result : Bool = networkProtocol.fetchRecord(name: movieTitle)
        
        if result == false {
            //networkProtocol.addMovie(coreDataMovie : movie )
            movieDetailsPrtocol.changeImage(imageName: "favorites")
        }else{
          
                movieDetailsPrtocol.changeImage(imageName: "fav3")
            
        }
    }
    
    func addMovieToCoreData(movie: MovieClass) {
       // networkProtocol.resetAllRecords(in: "Movie")
        let result : Bool = networkProtocol.fetchRecord(name: movie.original_title)
        print(result)
        
        if result == false {
            networkProtocol.addMovie(coreDataMovie : movie )
            movieDetailsPrtocol.changeImage(imageName: "fav3")
        }else{
            let res = networkProtocol.deleteRecord(movieName: movie.original_title)
            print(res)
            if res == true{
            movieDetailsPrtocol.changeImage(imageName: "favorites")
            }
        }
        
        
       // networkProtocol.fetchData()
        
    }
    
    func getMovieTrailers(id : Int32) {
        
        networkProtocol.getMovieTrailer(movieId: id, presenter: self)
        
    }
    
    func addTrailers(movieTrailers : [MovieTrailer])  {
        print(movieTrailers[0].name)
        movieDetailsPrtocol.updateTrailerCollectionView(trailers: movieTrailers)
    }
    
    
}
