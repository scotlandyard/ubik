//
//  VSummaryFooter.swift
//  ubik
//
//  Created by zero on 7/21/16.
//  Copyright © 2016 zero. All rights reserved.
//

import UIKit

class VSummaryFooter:UIView, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout
{
    weak var controller:CSummary!
    
    convenience init(controller:CSummary)
    {
        self.init()
        userInteractionEnabled = false
        clipsToBounds = true
        backgroundColor = UIColor.clearColor()
        translatesAutoresizingMaskIntoConstraints = false
        self.controller = controller
        
        
        let views:[String:AnyObject] = [:]
        
        let metrics:[String:AnyObject] = [:]
        
        addConstraints(NSLayoutConstraint.constraintsWithVisualFormat(
            "H:|-(margin)-[gyroBase]-(margin)-|",
            options:[],
            metrics:metrics,
            views:views))
        addConstraints(NSLayoutConstraint.constraintsWithVisualFormat(
            "V:|-(margin)-[gyroBase]-(margin)-|",
            options:[],
            metrics:metrics,
            views:views))
    }
    
    //MARK: collection del
    
    func numberOfSectionsInCollectionView(collectionView:UICollectionView) -> Int
    {
        return 1
    }
}