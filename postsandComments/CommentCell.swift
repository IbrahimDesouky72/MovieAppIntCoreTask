//
//  CommentCell.swift
//  MovieProject
//
//  Created by Ahmed Mokhtar on 7/23/18.
//  Copyright © 2018 IbrahimDesouky72. All rights reserved.
//

import UIKit

class CommentCell: UITableViewCell {

    @IBOutlet weak var comment: UILabel!
    @IBOutlet weak var userName: UILabel!
    @IBOutlet weak var profilePicture: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
