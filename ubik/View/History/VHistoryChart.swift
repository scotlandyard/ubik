import UIKit

class VHistoryChart:UIView, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout
{
    var model:MHistory?
    weak var collection:UICollectionView!
    private let kCellHeight:CGFloat = 50
    
    init()
    {
        super.init(frame:CGRectZero)
        translatesAutoresizingMaskIntoConstraints = false
        clipsToBounds = true
        
        let flow:UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        flow.headerReferenceSize = CGSizeZero
        flow.footerReferenceSize = CGSizeZero
        flow.minimumLineSpacing = 0
        flow.minimumInteritemSpacing = 0
        flow.sectionInset = UIEdgeInsetsZero
        flow.scrollDirection = UICollectionViewScrollDirection.Vertical
        
        let collection:UICollectionView = UICollectionView(frame:CGRectZero, collectionViewLayout:flow)
        collection.clipsToBounds = true
        collection.translatesAutoresizingMaskIntoConstraints = false
        collection.backgroundColor = UIColor.clearColor()
        collection.showsVerticalScrollIndicator = false
        collection.showsHorizontalScrollIndicator = false
        collection.alwaysBounceVertical = true
        collection.dataSource = self
        collection.delegate = self
        collection.registerClass(
            VHistoryChartCell.self,
            forCellWithReuseIdentifier:
            VHistoryChartCell.reusableIdentifier())
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
    
    required init?(coder:NSCoder)
    {
        fatalError()
    }
    
    //MARK: public
    
    func modelLoaded(model:MHistory)
    {
        self.model = model
        
        dispatch_async(dispatch_get_main_queue())
        { [weak self] in
            
            self?.collection.reloadData()
        }
    }
    
    //MARK: col del
    
    func collectionView(collectionView:UICollectionView, layout collectionViewLayout:UICollectionViewLayout, sizeForItemAtIndexPath indexPath:NSIndexPath) -> CGSize
    {
        let width:CGFloat = collectionView.bounds.maxX
        let size:CGSize = CGSizeMake(width, kCellHeight)
        
        return size
    }
    
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
        let cell:VHistoryChartCell = collectionView.dequeueReusableCellWithReuseIdentifier(
            VHistoryChartCell.reusableIdentifier(),
            forIndexPath:
            indexPath) as! VHistoryChartCell
        
        return cell
    }
}