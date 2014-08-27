//
//  FooterView.swift
//  SwiftMemoryTwister
//
//  Created by Suresh on 21/08/14.
//  Copyright (c) 2014 Neev. All rights reserved.
//

import UIKit

class FooterView: UICollectionReusableView {
    
    @IBOutlet var questionImageView : UIImageView = nil
    init(coder aDecoder: NSCoder!) {
        super.init(coder: aDecoder)
    }
    
    init(frame: CGRect) {
        super.init(frame: frame)
        
    }
    @IBAction func reloadButton(sender : AnyObject) {
        
        
    }
    
}
