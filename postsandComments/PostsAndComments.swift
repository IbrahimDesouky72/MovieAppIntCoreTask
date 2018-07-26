//
//  newDetailsView.swift
//  MovieProject
//
//  Created by Ahmed Mokhtar on 7/19/18.
//  Copyright © 2018 IbrahimDesouky72. All rights reserved.
//

import UIKit
import Kingfisher

class PostsAndComments: UIViewController , PostsAndCommentsProtocol {
    var postsPresenter : PostsAndCommentsPresenterProtocol?
    var movies = [MovieClass]()
    var posts = [Post]()
    var isSecondPressed = false
   // var v : UIView = UIView()
    var storedOffsets = [Int: CGFloat]()
    var movie = MovieClass()
    
    @IBOutlet weak var overview: UIButton!
    @IBOutlet weak var discussion: UIButton!
    @IBOutlet weak var collectionView: UICollectionView!
    
    //@IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        postsPresenter = PostsAndCommentsPresenter (postAndCommentProtocol : self)
        //NetworkCalls().getPosts(url: "https://jsonplaceholder.typicode.com/posts")
        postsPresenter?.getPosts(url: "https://jsonplaceholder.typicode.com/posts")
        makeViewRounded(myView: overview)
        makeViewRounded(myView: discussion)
        discussion.backgroundColor = UIColor.white
        discussion.setTitleColor(.gray, for: .normal)

        // Do any additional setup after loading the view.
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
    
    func makeViewRounded(myView : UIView)  {
        myView.layer.cornerRadius = 15
        
    }
    
    @IBAction func loadPostAndFilmDetails(_ sender: UIButton) {
        
        switch sender.tag {
        case 1:
           isSecondPressed = false
           overview.backgroundColor = UIColor(red: 148/255, green: 33/255, blue: 147/255, alpha: 1.0)
            overview.setTitleColor(.white, for: .normal)
           discussion.backgroundColor = UIColor.white
           discussion.setTitleColor(.gray, for: .normal)
            //collectionView.reloadData()
        default:
            isSecondPressed = true
            discussion.backgroundColor = UIColor(red: 148/255, green: 33/255, blue: 147/255, alpha: 1.0)
            discussion.setTitleColor(.white, for: .normal)
            overview.backgroundColor = UIColor.white
            overview.setTitleColor(.gray, for: .normal)
            
        }
        collectionView.reloadData()
    
    }
    
}

extension PostsAndComments :UICollectionViewDelegate, UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch isSecondPressed {
        case true:
            return posts.count
        default:
            return 1
        }
        
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        switch isSecondPressed {
        case true:
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
            
        default:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MovieDetailsCell", for: indexPath) as! MovieDetailsCell
            let url = URL(string: "https://image.tmdb.org/t/p/w500"+movie.poster_path)
            //imageView.kf.setImage(with: url)
           //cell.filmImage.kf.setImage(with: url)
            cell.filmName.text = movie.original_title
            cell.filmReleaseDate.text = movie.release_date
            cell.filmDescription.text = movie.overview
            cell.filmRating.settings.fillMode = .precise
            cell.filmRating.rating = Double(movie.vote_average/2.0)
            return cell
            
        }
        
        
        
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
