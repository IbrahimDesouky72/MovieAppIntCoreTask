//
//  AllMovies.swift
//  MovieProject
//
//  Created by IbrahimDesouky72 on 4/16/18.
//  Copyright © 2018 IbrahimDesouky72. All rights reserved.
//

import UIKit
import Alamofire
import SDWebImage



private let reuseIdentifier = "Cell"
fileprivate let sectionInsets = UIEdgeInsets(top: 50.0, left: 20.0, bottom: 50.0, right: 20.0)
//let allMoviesPresenter : AllMoviesPresenterProtocol!

class AllMovies: UICollectionViewController, UICollectionViewDelegateFlowLayout , AllMoviesPrtocol {
    var movies : [MovieClass] = [MovieClass]()
    var isTopRated = false
    
    @IBOutlet weak var topRated: UIBarButtonItem!
    
    
    func updateIU(moviesList: [MovieClass]) {
        movies = moviesList
        print(movies.count)
        print("here update ui /movies.count/")
        self.collectionView?.reloadData()
    }
    
    
    var movieResult = MovieResults()
    override func viewDidLoad() {
        super.viewDidLoad()
        let presenter : AllMoviesPresenterProtocol = AllMoviesPresenterClass(with : self)
        
        presenter.getAllMovies(movieType: 0)
        self.navigationItem.title = "All Movies"
        

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        //
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    @IBAction func getTopRatedMovies(_ sender: UIBarButtonItem) {
        if isTopRated == true{
            let presenter : AllMoviesPresenterProtocol = AllMoviesPresenterClass(with : self)
            
            presenter.getAllMovies(movieType: 0)
            topRated.title = "Top Rated"
            isTopRated = false
            
        }else {
            
            let presenter : AllMoviesPresenterProtocol = AllMoviesPresenterClass(with : self)
            
            presenter.getAllMovies(movieType: 1)
            topRated.title = "Most Popular"
            isTopRated = true
        }
        
        
        
        
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return movies.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! AllMoviesCell
    
        // Configure the cell
        
        //cell.backgroundColor = .red
        cell.filmName.text = movies[indexPath.row].original_title
        let imageURL : String = "https://image.tmdb.org/t/p/w500"+movies[indexPath.row].poster_path
        cell.filmImage.sd_setImage(with: URL(string: imageURL), placeholderImage: UIImage(named: "animal.png"))
        return cell
    }
    
    
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let selectedMovie : MovieClass = movies[indexPath.row]
        //print(selectedMovie.original_title)
        let detailController  = self.storyboard?.instantiateViewController(withIdentifier: "DetailsViewController") as! MovieDetailsViewController
        
        detailController.movie = selectedMovie
        print("hhhheeeeeeeeeeee"+String (detailController.movie.id))
        
        
        //self.navigationController?.pushViewController(detailController, animated: true)
    
        //print(self.navigationController)
        
        self.navigationController?.pushViewController(detailController, animated: true)
    }

    // MARK: UICollectionViewDelegate

    /*
    // Uncomment this method to specify if the specified item should be highlighted during tracking
    override func collectionView(_ collectionView: UICollectionView, shouldHighlightItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment this method to specify if the specified item should be selected
    override func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
    override func collectionView(_ collectionView: UICollectionView, shouldShowMenuForItemAt indexPath: IndexPath) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, canPerformAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, performAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) {
    
    }
    */
    
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//        return CGSize(width:150, height: 100)
//    }
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
//        return CGFloat(20.0)
//    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        //2
        let paddingSpace = sectionInsets.left * (2 + 1)
        let availableWidth = view.frame.width - paddingSpace
        let widthPerItem = availableWidth / 2
        
        return CGSize(width: widthPerItem+25, height: widthPerItem)
    }
    
    //3
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 1.0, left: 1.0, bottom: 1.0, right: 1.0)
    }
    
    // 4
//    func collectionView(_ collectionView: UICollectionView,
//                        layout collectionViewLayout: UICollectionViewLayout,
//                        minimumLineSpacingForSectionAt section: Int) -> CGFloat {
//        return sectionInsets.left
//    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat
    {
        
        return 4;
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat
    {
        
        return 1;
    }
    
    
    

}
