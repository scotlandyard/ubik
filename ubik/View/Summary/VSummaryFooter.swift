import UIKit

class VSummaryFooter:UIView, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout
{
    weak var controller:CSummary!
    weak var collection:UICollectionView!
    private var model:MSummary?
    
    convenience init(controller:CSummary)
    {
        self.init()
        userInteractionEnabled = false
        clipsToBounds = true
        backgroundColor = UIColor.clearColor()
        translatesAutoresizingMaskIntoConstraints = false
        self.controller = controller
        
        let flow:UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        flow.headerReferenceSize = CGSizeZero
        flow.footerReferenceSize = CGSizeZero
        flow.sectionInset = UIEdgeInsetsZero
        flow.scrollDirection = UICollectionViewScrollDirection.Vertical
        flow.minimumLineSpacing = 0
        flow.minimumInteritemSpacing = 0
        
        let collection:UICollectionView = UICollectionView(frame:CGRectZero, collectionViewLayout:flow)
        collection.backgroundColor = UIColor.clearColor()
        collection.clipsToBounds = true
        collection.translatesAutoresizingMaskIntoConstraints = false
        collection.showsVerticalScrollIndicator = false
        collection.showsHorizontalScrollIndicator = false
        collection.userInteractionEnabled = false
        collection.scrollEnabled = false
        collection.bounces = false
        collection.delegate = self
        collection.dataSource = self
        collection.registerClass(
            VSummaryFooterCell.self,
            forCellWithReuseIdentifier:
            VSummaryFooterCell.reusableIdentifier())
        self.collection = collection
        
        addSubview(collection)
        
        let views:[String:AnyObject] = [
            "collection":collection]
        
        let metrics:[String:AnyObject] = [:]
        
        addConstraints(NSLayoutConstraint.constraintsWithVisualFormat(
            "H:|-0-[collection]-0-|",
            options:[],
            metrics:metrics,
            views:views))
        addConstraints(NSLayoutConstraint.constraintsWithVisualFormat(
            "V:|-0-[collection]-0-|",
            options:[],
            metrics:metrics,
            views:views))
    }
    
    //MARK: public
    
    func update()
    {
        model = MSummary()
    }
    
    //MARK: collection del
    
    func numberOfSectionsInCollectionView(collectionView:UICollectionView) -> Int
    {
        let count:Int
        
        if model == nil
        {
            count = 0
        }
        else
        {
            count = 1
        }
        
        return count
    }
    
    func collectionView(collectionView:UICollectionView, numberOfItemsInSection section:Int) -> Int
    {
        let count:Int = model!.items.count
        
        return count
    }
    
    func collectionView(collectionView:UICollectionView, cellForItemAtIndexPath indexPath:NSIndexPath) -> UICollectionViewCell
    {
        let cell:VSummaryFooterCell = collectionView.dequeueReusableCellWithReuseIdentifier(
            VSummaryFooterCell.reusableIdentifier(),
            forIndexPath:
            indexPath) as! VSummaryFooterCell
        
        return cell
    }
}