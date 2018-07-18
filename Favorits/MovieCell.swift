//
//  MovieCell.swift
//  MovieProject
//
//  Created by IbrahimDesouky72 on 4/28/18.
//  Copyright © 2018 IbrahimDesouky72. All rights reserved.
//

import UIKit
import Cosmos

class MovieCell: UITableViewCell {

    @IBOutlet weak var ratingStars: CosmosView!
    
    @IBOutlet weak var ratingText: UILabel!
    @IBOutlet weak var movieImageView: UIImageView!
    @IBOutlet weak var movieRating: UILabel!
    @IBOutlet weak var movieTitle: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
