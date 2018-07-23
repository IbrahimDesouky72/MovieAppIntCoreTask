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
    var v : UIView = UIView()
    
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
    
    
    
    
    
}

//extension PostsAndComments : UITableViewDelegate, UITableViewDataSource {
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//            //print("11111111")
//            return posts.count
//
//    }
//
//
//    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        return 400.0
//    }
//    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
//        cell.contentView.backgroundColor = UIColor.clear
//
//        let whiteRoundedView : UIView = UIView(frame: CGRect(x: 10, y: 10, width: self.view.frame.size.width - 20, height: 350))
//
//        whiteRoundedView.layer.backgroundColor = CGColor(colorSpace: CGColorSpaceCreateDeviceRGB(), components: [1.0, 1.0, 1.0, 1.0])
//        whiteRoundedView.layer.masksToBounds = false
//        whiteRoundedView.layer.cornerRadius = 2.0
//        whiteRoundedView.layer.shadowOffset = CGSize(width: -1, height: 1)
//        whiteRoundedView.layer.shadowOpacity = 0.2
//
//        cell.contentView.addSubview(whiteRoundedView)
//        cell.contentView.sendSubview(toBack: whiteRoundedView)
//    }
//
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//
//            let cell = tableView.dequeueReusableCell(withIdentifier: "PostsCell", for: indexPath) as! PostsCell
//            cell.postText.text = posts[indexPath.row].body
//           // cell.postText.sizeToFit()
//
//            return cell
//
//    }
//
//
//
//
//}
