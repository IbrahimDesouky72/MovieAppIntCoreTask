//
//  PostsCollectionCell.swift
//  MovieProject
//
//  Created by Ahmed Mokhtar on 7/22/18.
//  Copyright © 2018 IbrahimDesouky72. All rights reserved.
//

import UIKit

class PostsCollectionCell: UICollectionViewCell {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var profilePicture: UIImageView!
    @IBOutlet weak var userName: UILabel!
    @IBOutlet weak var postContent: UILabel!
    @IBOutlet weak var postPicture: UIImageView!

    
}

extension PostsCollectionCell {
    func setTableViewDataSourceDelegate<D: UITableViewDataSource & UITableViewDelegate>(_ dataSourceDelegate: D, forRow row: Int) {
        
        tableView.delegate = dataSourceDelegate
        tableView.dataSource = dataSourceDelegate
        tableView.tag = row
        tableView.setContentOffset(tableView.contentOffset, animated:false) // Stops collection view if it was scrolling.
        tableView.reloadData()
    }
    
    var collectionViewOffset: CGFloat {
        set { tableView.contentOffset.x = newValue }
        get { return tableView.contentOffset.x }
    }
    
    
}
