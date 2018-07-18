//
//  FavoritesMovies.swift
//  MovieProject
//
//  Created by IbrahimDesouky72 on 4/17/18.
//  Copyright © 2018 IbrahimDesouky72. All rights reserved.
//

import UIKit

class FavoritesMovies: UITableViewController , FavoriteMoviesProtocol{
    var movies : [MovieClass] = [MovieClass]()
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
        //loadData()
    }
    
    func loadData()  {
        let presenter : FavoriteMoviesPresenterProtocol = FavoriteMoviesPresenterClass(with: self)
       movies =  presenter.getFavoritesMovies()
        
        
    }
    override func viewWillAppear(_ animated: Bool) {
        loadData()
        tableView.rowHeight = 188
        tableView.reloadData()
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
        return movies.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FavoritesMoviesCell", for: indexPath) as! MovieCell

        // Configure the cell...
        let imageURL : String = "https://image.tmdb.org/t/p/w500"+movies[indexPath.row].poster_path
        cell.movieImageView.sd_setImage(with: URL(string: imageURL), placeholderImage: UIImage(named: "animal.png"))
        cell.movieTitle.text = movies[indexPath.row].original_title
        cell.movieRating.text = String(movies[indexPath.row].vote_average)
        cell.ratingStars.isUserInteractionEnabled = false
        cell.ratingStars.settings.fillMode = .precise
        cell.ratingStars.rating = Double(movies[indexPath.row].vote_average/2.0)
        //print(movies[indexPath.row].vote_average/2.0)
        
        
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedMovie : MovieClass = movies[indexPath.row]
        //print(selectedMovie.original_title)
        let detailController  = self.storyboard?.instantiateViewController(withIdentifier: "DetailsViewController") as! MovieDetailsViewController
        
        detailController.movie = selectedMovie
        print(detailController.movie.original_title)
        
        //self.navigationController?.pushViewController(detailController, animated: true)
        
        //print(self.navigationController)
        
        self.navigationController?.pushViewController(detailController, animated: true)
        
    }
    

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
