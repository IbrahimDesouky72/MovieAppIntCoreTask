//
//  ViewController.swift
//  MovieProject
//
//  Created by Ahmed Mokhtar on 7/18/18.
//  Copyright © 2018 IbrahimDesouky72. All rights reserved.
//

import UIKit
import CarbonKit

class ViewController: UIViewController ,CarbonTabSwipeNavigationDelegate{
    var movie = MovieClass()
    //var carbonTabSwipeNavigation: CarbonTabSwipeNavigation = CarbonTabSwipeNavigation()
    override func viewDidLoad() {
        super.viewDidLoad()
        print("helllaaaaaa")
        let items = ["OverView", "Discussion"]
        let carbonTabSwipeNavigation = CarbonTabSwipeNavigation(items: items, delegate: self)
        carbonTabSwipeNavigation.insert(intoRootViewController: self)
        //carbonTabSwipeNavigation.setTabExtraWidth(30)
        carbonTabSwipeNavigation.carbonSegmentedControl!.setWidth(view.frame.size.width/2, forSegmentAt: 0)
        carbonTabSwipeNavigation.carbonSegmentedControl!.setWidth(view.frame.size.width/2, forSegmentAt: 1)
        
        //self.style()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    
    func style() {

        
    }
    
    func carbonTabSwipeNavigation(_ carbonTabSwipeNavigation: CarbonTabSwipeNavigation, viewControllerAt index: UInt) -> UIViewController {
        
        switch index {
        case 0:
            let movieDetails = self.storyboard!.instantiateViewController(withIdentifier: "DetailsViewController") as! MovieDetailsViewController
            
            movieDetails.movie = self.movie
            return movieDetails
        default:
            return self.storyboard!.instantiateViewController(withIdentifier: "DetailsViewController") as! MovieDetailsViewController
        }
        // return viewController at index
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
