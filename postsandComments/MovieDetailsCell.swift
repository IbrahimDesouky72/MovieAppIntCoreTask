//
//  MovieDetailsCell.swift
//  MovieProject
//
//  Created by Ahmed Mokhtar on 7/25/18.
//  Copyright © 2018 IbrahimDesouky72. All rights reserved.
//

import UIKit
import Cosmos

class MovieDetailsCell: UICollectionViewCell {
    
    @IBOutlet weak var filmReleaseDate: UILabel!
    @IBOutlet weak var filmRating: CosmosView!
    @IBOutlet weak var filmImage: UIImageView!
    @IBOutlet weak var filmName: UILabel!
    @IBOutlet weak var filmDescription: UITextView!
}
