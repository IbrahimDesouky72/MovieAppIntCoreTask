//
//  NetworkCalls.swift
//  MovieProject
//
//  Created by IbrahimDesouky72 on 4/18/18.
//  Copyright © 2018 IbrahimDesouky72. All rights reserved.
//

import Foundation
import  Alamofire
import CoreData

class NetworkCalls : NetworkProtocol {
    var movies = [MovieClass]()
    var movieResult = MovieResults()
    var posts = [Post]()
    var comments = [Comment]()
    
    
    var movieTrailers : [MovieTrailer] = [MovieTrailer]()
    var trailerResults = TrailerResults()
    
    var movieReviews : [ MovieReviewsData] = [MovieReviewsData]()
    var reviewResults = MovieReviewsResults()
    
    
    func getMovieReviews(movieId : Int32 , presenter : MovieReviewsPresenterProtocol) {
        let url : URL = URL(string: "https://api.themoviedb.org/3/movie/"+String(movieId)+"/reviews?api_key=f6def6aa687f88e2c4bdac26cc09ee44&language=en-US")!
        
        Alamofire.request(url).responseJSON{(response) in
            
            let jsonData = response.data
            
            do{
                self.reviewResults = try JSONDecoder().decode(MovieReviewsResults.self, from: jsonData!)
                self.movieReviews = self.reviewResults.results
                
                print(self.movieTrailers.count)
                //presenter.addTrailers(movieTrailers: self.movieTrailers)
                presenter.addReviewsToTableView(movieReviews: self.movieReviews)
                
                
                
            } catch {
                print("errorrrrrrrr")
            }
            
        }
        
    }
    
    func getMovieTrailer(movieId : Int32 ,presenter : MovieDetailsPresenterPrtocol){
        print("movie id "+String(movieId))
        
        let url : URL = URL(string: "https://api.themoviedb.org/3/movie/"+String(movieId)+"/videos?api_key=f6def6aa687f88e2c4bdac26cc09ee44&language=en-US")!
        
        Alamofire.request(url).responseJSON{(response) in
            
            let jsonData = response.data
            
            do{
                self.trailerResults = try JSONDecoder().decode(TrailerResults.self, from: jsonData!)
                self.movieTrailers = self.trailerResults.results
                
                print(self.movieTrailers.count)
                presenter.addTrailers(movieTrailers: self.movieTrailers)
               
                
                
            } catch {
                print("errorrrrrrrr")
            }
            
        }
        
        
    }
    
    func getMovies(type: Int , presenter : AllMoviesPresenterProtocol) {
        let url: URL
        switch type {
        case 0:
            url = URL(string: "https://api.themoviedb.org/3/discover/movie?api_key=f6def6aa687f88e2c4bdac26cc09ee44&sort_by=popularity.desc")!
        case 1:
            url = URL(string: "https://api.themoviedb.org/3/movie/top_rated?api_key=f6def6aa687f88e2c4bdac26cc09ee44&language=en-US&page=1")!
        default:
            url = URL(string: "https://api.themoviedb.org/3/discover/movie?api_key=f6def6aa687f88e2c4bdac26cc09ee44&sort_by=popularity.desc")!
        }
        
        Alamofire.request(url).responseJSON{ (response) in
            //print(response)
            
            let jsonData = response.data
            do{
                self.movieResult = try JSONDecoder().decode(MovieResults.self, from: jsonData!)
                self.movies = self.movieResult.results
                

                presenter.moviesCallBack(movies: self.movies)
                print("ana rage3 ")
                
                
            } catch {
                print("error")
            }
            
        }
        
    }
    func fetchRecord(name: String) -> Bool {
        let appDelegete = UIApplication.shared.delegate as! AppDelegate
        let managedContext = appDelegete.persistentContainer.viewContext
        
        
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "Movie")
        let myPredicate = NSPredicate(format: "originalTitle = %@",name)
        fetchRequest.predicate = myPredicate
        var result : Bool = false
        print(name)
        do {
            var m : [Movie] = [Movie]()
            m = try managedContext.fetch(fetchRequest) as! [Movie]
            if m.count > 0 {
              result = true
            }
            
        }catch{
            print("error")
        }
        return result
    }
    
    func addMovie(coreDataMovie : MovieClass)  {
        let appDelegete = UIApplication.shared.delegate as! AppDelegate
        let managedContext = appDelegete.persistentContainer.viewContext
        
        let entity = NSEntityDescription.entity(forEntityName: "Movie", in: managedContext)
        
        
        //print(coreDataMovie.id)
        
        let movie = NSManagedObject(entity: entity!, insertInto: managedContext)
            movie.setValue(coreDataMovie.id, forKey: "id")
            movie.setValue(coreDataMovie.original_title, forKey: "originalTitle")
            movie.setValue(coreDataMovie.backdrop_path, forKey: "backDropPath")
            movie.setValue(coreDataMovie.overview, forKey: "overview")
            movie.setValue(coreDataMovie.poster_path, forKey: "posterPath")
            movie.setValue(coreDataMovie.release_date, forKey: "releaseDate")
            movie.setValue(coreDataMovie.vote_average, forKey: "rating")
            
            
            do {
                try managedContext.save()
            }catch let error as NSError{
                print(error)
                
            }
        
    }
    

    
    func fetchData() ->[MovieClass] {
        let appDelegete = UIApplication.shared.delegate as! AppDelegate
        let managedContext = appDelegete.persistentContainer.viewContext
        
        
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "Movie")
         var favoriteMovies : [MovieClass] = [MovieClass]()
        
        do {
            var m : [Movie] = [Movie]()
            m = try managedContext.fetch(fetchRequest) as! [Movie]
            print("fetch +"+String(m.count))
            
           
            
            for movie in m {
                //print(movie.originalTitle)
                let movieClass : MovieClass = MovieClass()
                movieClass.backdrop_path = movie.backDropPath
                movieClass.id = movie.id
                movieClass.original_title = movie.originalTitle!
                movieClass.overview = movie.overview!
                movieClass.poster_path = movie.posterPath!
                movieClass.release_date = movie.releaseDate!
                movieClass.vote_average = movie.rating
                
                favoriteMovies.append(movieClass)
            }
           
        }catch{
            print("error")
        }
        return favoriteMovies
    }
    
    func resetAllRecords(in entity : String) // entity = Your_Entity_Name
    {
        
        let context = ( UIApplication.shared.delegate as! AppDelegate ).persistentContainer.viewContext
        let deleteFetch = NSFetchRequest<NSFetchRequestResult>(entityName: entity)
        let deleteRequest = NSBatchDeleteRequest(fetchRequest: deleteFetch)
        do
        {
            try context.execute(deleteRequest)
            try context.save()
            
        }
        catch
        {
            print ("There was an error")
        }
    }
    
    func deleteRecord(movieName : String) -> Bool {
        let context = ( UIApplication.shared.delegate as! AppDelegate ).persistentContainer.viewContext
        let deleteFetch = NSFetchRequest<NSFetchRequestResult>(entityName: "Movie")
        
        //let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Movie")
        do {
            let result = try context.fetch(deleteFetch)
            for data in result as! [Movie] {
                if data.originalTitle == movieName {
                    context.delete(data)
                    
                    return true
                }
            }
            try context.save()
        } catch {
            print("Failed")
        }
        return false
        
    }
    
    func getPosts(url : String , postsPresenter: PostsAndCommentsPresenterProtocol) -> [Post] {
        
        print("network get posts ")
        Alamofire.request(url).responseJSON{ (response) in
            //print(response)
            
            let jsonData = response.data
            do{
                
                self.posts = try JSONDecoder().decode([Post].self, from: jsonData!)
                self.comments = self.getComments(url: "https://jsonplaceholder.typicode.com/comments", postsPresenter: postsPresenter)
                print(self.comments.count)
                
                
            } catch {
                print("error posts")
            }
            
        }
        
        return posts
        
    }
    
    func getComments(url :String , postsPresenter: PostsAndCommentsPresenterProtocol) -> [Comment] {
        //var comments = [Comment]()
        
        Alamofire.request(url).responseJSON{ (response) in
            //print(response)
            
            let jsonData = response.data
            do{
                print(self.posts.count)
                self.comments = try JSONDecoder().decode([Comment].self, from: jsonData!)
                for post in self.posts{
                    
                    post.comments = self.comments.filter {
                        $0.postId == post.id
                    }
                }
                print("helooo \(self.posts[0].comments.count)")
                postsPresenter.updateUI(posts: self.posts)
               
                
            } catch {
                print("error comments")
            }
            
        }
        
        return comments
    }
    
    
}
