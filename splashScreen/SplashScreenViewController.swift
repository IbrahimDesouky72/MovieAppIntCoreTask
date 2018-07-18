//
//  ViewController.swift
//  MovieProject
//
//  Created by IbrahimDesouky72 on 4/16/18.
//  Copyright © 2018 IbrahimDesouky72. All rights reserved.
//

import UIKit
import Lottie

class SplashScreenViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let animationView = LOTAnimationView(name: "splash")
        animationView.cacheEnable = true
        animationView.frame = CGRect(x: 0, y: 0, width: 400, height: 400)
        animationView.center = self.view.center
        animationView.contentMode = .scaleAspectFill
        self.view.addSubview(animationView)
        animationView.play{ (finished) in
            animationView.play{ (finished) in
                animationView.play{ (finished) in
                    animationView.play{ (finished) in
                        animationView.play{ (finished) in
                            animationView.play{ (finished) in
                                
                                self.performSegue(withIdentifier: "homePage", sender: self)
                            }
                        }
                        
                    }
                    
                }
                
            }
            
            
        }
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

