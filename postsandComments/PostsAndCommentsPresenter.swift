//
//  PostsAndCommentsPresenter.swift
//  MovieProject
//
//  Created by Ahmed Mokhtar on 7/20/18.
//  Copyright © 2018 IbrahimDesouky72. All rights reserved.
//

import Foundation
class PostsAndCommentsPresenter : PostsAndCommentsPresenterProtocol {
    var postAndCommentProtocol : PostsAndCommentsProtocol
    var networkCalls : NetworkProtocol = NetworkCalls()
    
    
    init(postAndCommentProtocol : PostsAndCommentsProtocol) {
        self.postAndCommentProtocol = postAndCommentProtocol
    }
    
   
    
    func getPosts(url : String){
        var posts = [Post]()
        posts = networkCalls.getPosts(url: "https://jsonplaceholder.typicode.com/posts", postsPresenter: self)
        //print(posts[0].comments.count)
        
    }
    func updateUI(posts : [Post])  {
        print("presenter \(posts.count) \(posts[5].comments.count)")
        postAndCommentProtocol.updateUI(posts: posts)
        
    }
}
