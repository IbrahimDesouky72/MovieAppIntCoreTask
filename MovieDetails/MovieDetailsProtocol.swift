//
//  MovieDetailsProtocol.swift
//  MovieProject
//
//  Created by IbrahimDesouky72 on 4/27/18.
//  Copyright © 2018 IbrahimDesouky72. All rights reserved.
//

import Foundation

protocol MovieDetailsPrtocol {
    func loadData()
    func updateTrailerCollectionView(trailers : [MovieTrailer])
    func playInYoutube(youtubeId: String)
    func changeImage(imageName : String)
}
