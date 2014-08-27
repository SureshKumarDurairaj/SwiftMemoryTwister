//
//  IndexViewController.swift
//  SwiftMindTwister
//
//  Created by Suresh on 20/08/14.
//  Copyright (c) 2014 Neev. All rights reserved.
//

import UIKit


class IndexViewController: UIViewController {
    init(coder aDecoder: NSCoder!) {
        super.init(coder: aDecoder)
        
    }
    
    
    
    @IBAction func startGameButton(sender : AnyObject) {
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController.navigationBar.hidden = true
                
        
    }
    
    func getRandomIndice( M : Int) -> (Array<UIImage>){
        var randomImages : Array<UIImage> = []
        var r : Int
        while( randomImages.count < 12){
            r = Int(arc4random()) % M
            var flag = 0
            for i in randomImages{
                if(i == mySingleton.imageResources[r]){
                    flag = -1
                }
            }
            if(flag == 0){
                randomImages.append(mySingleton.imageResources[r])
            }
        }
        return randomImages
        
    }


    @IBAction func playNowTapped(sender : AnyObject) {
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let gameVC =
        storyboard.instantiateViewControllerWithIdentifier("GridViewController") as GridViewController
        
        gameVC.imageArray = self.getRandomIndice(mySingleton.imageResources.count)
        self.navigationController.pushViewController(gameVC as UICollectionViewController ,animated: true)
        
        
        
    }
    
        
        class var sharedInstance : IndexViewController {
        struct Static {
            static let instance : IndexViewController = IndexViewController(coder:nil)
            }
            return Static.instance
        }
        
    

}
