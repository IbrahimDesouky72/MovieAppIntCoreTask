//
//  newDetailsView.swift
//  MovieProject
//
//  Created by Ahmed Mokhtar on 7/19/18.
//  Copyright © 2018 IbrahimDesouky72. All rights reserved.
//

import UIKit

class PostsAndComments: UIViewController , PostsAndCommentsProtocol {
    var postsPresenter : PostsAndCommentsPresenterProtocol?
    var movies = [MovieClass]()
    var posts = [Post]()
    var isSecondPressed = false
   // var v : UIView = UIView()
    var storedOffsets = [Int: CGFloat]()
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    //@IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        postsPresenter = PostsAndCommentsPresenter (postAndCommentProtocol : self)
        //NetworkCalls().getPosts(url: "https://jsonplaceholder.typicode.com/posts")
        postsPresenter?.getPosts(url: "https://jsonplaceholder.typicode.com/posts")

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func updateUI(posts : [Post]){
        
        print(posts[0].body)
        self.posts = posts
        //tableView.reloadData()
        collectionView.reloadData()
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

extension PostsAndComments :UICollectionViewDelegate, UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return posts.count
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PostsCollectionCell", for: indexPath) as! PostsCollectionCell
        cell.postContent.text = posts[indexPath.row].body
        //cell.postContent.sizeToFit()
        
        cell.contentView.layer.cornerRadius = 4.0
        cell.contentView.layer.borderWidth = 1.0
        cell.contentView.layer.borderColor = UIColor.clear.cgColor
        cell.contentView.layer.masksToBounds = false
        cell.layer.shadowColor = UIColor.gray.cgColor
        cell.layer.shadowOffset = CGSize(width: 0, height: 1)
        cell.layer.shadowRadius = 4.0
        cell.layer.shadowOpacity = 1.0
        cell.layer.masksToBounds = false
        cell.layer.shadowPath = UIBezierPath(roundedRect: cell.bounds, cornerRadius: cell.contentView.layer.cornerRadius).cgPath
        
        cell.postPicture.image = UIImage(named: "animal")
        
        return cell
        
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        guard let collectionViewCell = cell as? PostsCollectionCell else { return }
        
        collectionViewCell.setTableViewDataSourceDelegate(self, forRow: indexPath.row)
        collectionViewCell.collectionViewOffset = storedOffsets[indexPath.row] ?? 0
        
        
    }
    
    
    
    
    
    
    
}

extension PostsAndComments :UITableViewDelegate , UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return posts[tableView.tag].comments.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CommentCell", for: indexPath) as! CommentCell
        cell.comment.text = posts[tableView.tag].comments[indexPath.row].body
        return cell
    }
    
    
    
}
