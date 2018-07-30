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
