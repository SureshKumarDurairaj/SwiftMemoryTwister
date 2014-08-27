//
//  ViewController.swift
//  SwiftMindTwister
//
//  Created by Suresh on 19/08/14.
//  Copyright (c) 2014 Neev. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    init(coder aDecoder: NSCoder!) {
        super.init(coder: aDecoder)
        
    }
    
    
    @IBOutlet var loginButton : UIButton = nil
                            
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        var networkStatus = Reachability.reachabilityForInternetConnection().currentReachabilityStatus().value
        var isNetworkAvailable : Bool = false
        if(networkStatus == 0){
            println("Network Unavailable")
        }
            
        else {
            for i in mySingleton.objects{
                var url = NSURL(string: i)
                let task = NSURLSession.sharedSession().dataTaskWithURL(url) {(data, response, error) in
                    var image = UIImage(data: data) as UIImage
                    if(image != nil){
                        println("success")
                        mySingleton.imageResources.append(image)
                    }
                    else {
                        println("resource not available \(url)")
                    }
                }
                task.resume()
            }
            isNetworkAvailable = true
        }
        if(!isNetworkAvailable){
            self.loginButton.enabled = false
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func loginButton(sender : AnyObject) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let indexVC =
        storyboard.instantiateViewControllerWithIdentifier("IndexViewController") as IndexViewController
        
        self.navigationController.pushViewController(indexVC as UIViewController ,animated: true)
        
    }

}

