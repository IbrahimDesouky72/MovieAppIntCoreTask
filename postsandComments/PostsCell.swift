//
//  PostsCell.swift
//  MovieProject
//
//  Created by Ahmed Mokhtar on 7/21/18.
//  Copyright © 2018 IbrahimDesouky72. All rights reserved.
//

import UIKit

class PostsCell: UITableViewCell {

    @IBOutlet weak var postText: UILabel!
    @IBOutlet weak var userName: UILabel!
    @IBOutlet weak var profilePicture: UIImageView!
    @IBOutlet weak var postPicture: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
