//
//  GridViewController.swift
//  SwiftMindTwister
//
//  Created by Suresh on 21/08/14.
//  Copyright (c) 2014 Neev. All rights reserved.
//

import UIKit

class GridViewController: UICollectionViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    var headerView = HeaderView()
    var footerView = FooterView()

    var randomNumber : Int = 0
    var quizMode  = false
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.imageArray = shuffle(self.imageArray)
        self.navigationController.navigationBar.hidden = false
        var barButton = UIBarButtonItem(image: UIImage(named: "arrow_reload.png"), style: UIBarButtonItemStyle.Plain, target: self, action: "goBack")
        self.navigationController.navigationItem.leftBarButtonItem = barButton
        
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        self.callForWait()
        println("After callForWait(()")
        footerView.questionImageView.hidden = true
        
    }
    func goBack(){
        if(self.navigationController.navigationBar){
            self.navigationController.popViewControllerAnimated(true)
        }
    }
    
    var visitedArray : Array<String> = String[](count:12, repeatedValue:"false")
    
    func callForWait(){
        
        let delay = 20 * Double(NSEC_PER_SEC)
        let time = dispatch_time(DISPATCH_TIME_NOW, Int64(delay))
        dispatch_after(time, dispatch_get_main_queue())  { println("after delay")
            self.stepsAfterDelay()
        }

    }
    
    func stepsAfterDelay(){
        println("stepsAfterDelay()")
        self.randomNumberGeneration()
        self.quizMode = true
        self.collectionView.reloadData()
//      footerView.questionImageView.image = UIImage
        
        
    }
    
    
    var imageArray : Array<UIImage> = []
    
    
    override func collectionView(collectionView: UICollectionView!, cellForItemAtIndexPath indexPath: NSIndexPath!) -> UICollectionViewCell! {
        var cell = collectionView.dequeueReusableCellWithReuseIdentifier("cell", forIndexPath: indexPath) as ImageViewCell
      
        if(quizMode == false)
        {
            cell.imageView.image = imageArray[indexPath.row]
            
        }
        else{
            if(self.visitedArray[indexPath.row] == "true")
            {
                cell.imageView.image = imageArray[indexPath.row]
            }
            else{
            cell.imageView.image = UIImage(named:"placeholder.png")
        
            }
        }
        return cell
        
    }
   
   
    override func collectionView(collectionView: UICollectionView!, numberOfItemsInSection section: Int) -> Int {
        
        return self.imageArray.count
    }
   
    override func collectionView(collectionView: UICollectionView!, didSelectItemAtIndexPath indexPath: NSIndexPath!) {
        if(indexPath.row == randomNumber){
             self.visitedArray[self.randomNumber] = "true"
            self.randomNumberGeneration()            
            
        }
        
       println("array index \(indexPath.row)")
    }
    
    override func collectionView(collectionView: UICollectionView!, viewForSupplementaryElementOfKind kind: String!, atIndexPath indexPath: NSIndexPath!) -> UICollectionReusableView! {
        footerView = self.collectionView.dequeueReusableSupplementaryViewOfKind(UICollectionElementKindSectionFooter, withReuseIdentifier: "footer", forIndexPath: indexPath) as FooterView
        return footerView
        
    }
    
    func shuffle<T>(var list: Array<T>) -> Array<T> {
        for i in 0..list.count-1 {
            let j = Int(arc4random_uniform(UInt32(list.count - i))) + i
            list.insert(list.removeAtIndex(j), atIndex: i)
        }
        return list
    }
    
    func randomNumberGeneration(){
        
        var j = Int(arc4random() % 12)
        var temp :String =  self.visitedArray[j]
        if(temp == "false"){
            println("j \(j)");
            self.randomNumber = j
            footerView.questionImageView.image = self.imageArray[j]
            self.collectionView.reloadData()
            return
        }
        else{
            var shouldFindNext = self.stillHaveImage()
            if(shouldFindNext){
                self.randomNumberGeneration()
            }
            
            
            
        }
        
    }
    
    func stillHaveImage()->Bool{
        for i in self.visitedArray{
            if(i == "false"){
                return true
            }
        }
        return false
    }

}
