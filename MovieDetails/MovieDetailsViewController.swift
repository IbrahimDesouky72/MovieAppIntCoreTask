//
//  MovieDetailsViewController.swift
//  MovieProject
//
//  Created by IbrahimDesouky72 on 4/24/18.
//  Copyright © 2018 IbrahimDesouky72. All rights reserved.
//

import UIKit
import SDWebImage

class MovieDetailsViewController: UITableViewController , MovieDetailsPrtocol {
    var movie : MovieClass = MovieClass ()
    var movieTrailersArray = [MovieTrailer]()
    let reuseIdentifier = "DetailsCollectionViewCell"
    var movieDetailsPresenter : MovieDetailsPresenterPrtocol?

    @IBAction func getMovieReviews(_ sender: UIButton) {
        let reviewViewController = self.storyboard?.instantiateViewController(withIdentifier: "reviewPage") as! MovieReviewsTableViewController
        
        reviewViewController.movieId = movie.id
        self.navigationController?.pushViewController(reviewViewController, animated: true)
        
        
        
    }
    @IBAction func addMovieToCoreData(_ sender: UIButton) {
        
        
        let presenter : MovieDetailsPresenterPrtocol = MovieDetailsPresenterClass(with: self)
        print(movie.original_title)
        presenter.addMovieToCoreData(movie: movie)
        
    }
    @IBOutlet weak var movieRating: UILabel!
    @IBOutlet weak var movieReleaseDate: UILabel!
    @IBOutlet weak var movieTitle: UILabel!
    
    @IBOutlet weak var favoriteImage: UIButton!
    @IBOutlet weak var movieTrailers: UICollectionView!
    @IBOutlet weak var movieDescription: UITextView!
    @IBOutlet weak var movieImage: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.tabBarItem.title = "Movie Details"

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
        movieDetailsPresenter = MovieDetailsPresenterClass(with : self)
        loadData()
        
    }
    
    func loadData() {
        movieTrailers.delegate = self
        movieTrailers.dataSource = self
        let imageURL : String = "https://image.tmdb.org/t/p/w500"+movie.poster_path
        movieImage.sd_setImage(with: URL(string: imageURL), placeholderImage: UIImage(named: "animal.png"))
        movieDescription.text = movie.overview
        movieDetailsPresenter?.getMovieTrailers(id: movie.id)
        print(movie.id)
        movieDetailsPresenter?.isFavourite(movieTitle: movie.original_title)
        
        
        
        
    }
    override func viewWillAppear(_ animated: Bool) {
        movieDetailsPresenter?.isFavourite(movieTitle: movie.original_title)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 6
    }
    
    func updateTrailerCollectionView(trailers : [MovieTrailer]) {
        movieTrailersArray = trailers
        print("trailers count " + String(movieTrailersArray.count))
        movieTrailers.reloadData()
    }
    
    func playInYoutube(youtubeId: String) {
        if let youtubeURL = URL(string: "youtube://\(youtubeId)"),
            UIApplication.shared.canOpenURL(youtubeURL) {
            // redirect to app
            UIApplication.shared.open(youtubeURL, options: [:], completionHandler: nil)
        } else if let youtubeURL = URL(string: "https://www.youtube.com/watch?v=\(youtubeId)") {
            // redirect through safari
            UIApplication.shared.open(youtubeURL, options: [:], completionHandler: nil)
        }
    }

    func changeImage(imageName : String)  {
        favoriteImage.setImage(UIImage(named: imageName), for: UIControlState.normal)
        tableView.reloadData()
    }
    /*override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.row == 0 {
            //configure cell type 1
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "imageCell", for: indexPath)
            
        
            
            
        } else if indexPath.row == 1 {
            //configure cell type 2
            
        }
        

        // Configure the cell...

        return cell
    }*/
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

extension MovieDetailsViewController : UICollectionViewDelegate , UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! TrailerCollectionViewCell
        let movieTrailer = movieTrailersArray[indexPath.row]
        
        let trailerKey = movieTrailer.key
        print(trailerKey)
        let trialerURL = "https://img.youtube.com/vi/\(trailerKey)/sddefault.jpg"
        cell.trailerImageView.sd_setImage(with: URL(string: trialerURL), placeholderImage: UIImage(named: "animal.png"))
        cell.trailerName.text = movieTrailer.name
        
        return cell
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return movieTrailersArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        playInYoutube(youtubeId: movieTrailersArray[indexPath.row].key)
    }
    
   
    
}
