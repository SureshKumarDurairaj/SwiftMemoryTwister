//
//  ImageViewCell.swift
//  SwiftMindTwister
//
//  Created by Suresh on 21/08/14.
//  Copyright (c) 2014 Neev. All rights reserved.
//

import UIKit

class ImageViewCell: UICollectionViewCell {
    init(coder aDecoder: NSCoder!) {
        super.init(coder: aDecoder)
        
    }
    
    @IBOutlet var imageView : UIImageView
    
    init(frame: CGRect) {
        super.init(frame: CGRectMake(0, 0, 90, 80))
        self.imageView.frame = CGRectMake(0, 0, 90, 80)
        
    }
    
    

}
