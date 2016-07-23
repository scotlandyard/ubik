import UIKit

class VHistoryChartDisplay:UIView, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout
{
    weak var collection:UICollectionView!
    weak var model:MHistoryItem?
    private let kCollectionTop:CGFloat = 100
    
    init()
    {
        super.init(frame:CGRectZero)
        userInteractionEnabled = false
        clipsToBounds = true
        translatesAutoresizingMaskIntoConstraints = false
        
        let flow:UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        flow.headerReferenceSize = CGSizeZero
        flow.footerReferenceSize = CGSizeZero
        flow.minimumLineSpacing = 0
        flow.minimumInteritemSpacing = 0
        flow.sectionInset = UIEdgeInsets(top:kCollectionTop, left:0, bottom:0, right:0)
        flow.scrollDirection = UICollectionViewScrollDirection.Vertical
        
        let collection:UICollectionView = UICollectionView(frame:CGRectZero, collectionViewLayout:flow)
        collection.clipsToBounds = true
        collection.translatesAutoresizingMaskIntoConstraints = false
        collection.userInteractionEnabled = false
        collection.backgroundColor = UIColor.clearColor()
        collection.scrollEnabled = false
        collection.bounces = false
        collection.showsVerticalScrollIndicator = false
        collection.showsHorizontalScrollIndicator = false
        collection.dataSource = self
        collection.delegate = self
        collection.registerClass(
            VHistoryChartDisplayCellDate.self,
            forCellWithReuseIdentifier:
            VHistoryChartDisplayCellDate.reusableIdentifier())
        collection.registerClass(
            VHistoryChartDisplayCellAmount.self,
            forCellWithReuseIdentifier:
            VHistoryChartDisplayCellAmount.reusableIdentifier())
        collection.registerClass(
            VHistoryChartDisplayCellTitle.self,
            forCellWithReuseIdentifier:
            VHistoryChartDisplayCellTitle.reusableIdentifier())
        collection.registerClass(
            VHistoryChartDisplayCellImage.self,
            forCellWithReuseIdentifier:
            VHistoryChartDisplayCellImage.reusableIdentifier())
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
    
    //MARK: private
    
    func modelAtIndex(index:NSIndexPath) -> MHistoryItemComponent
    {
        let item:MHistoryItemComponent = model!.components[index.item]
        
        return item
    }
    
    //MARK: public
    
    func hikeSelected(model:MHistoryItem)
    {
        self.model = model
        collection.reloadData()
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
        let count:Int = model!.components.count
        
        return count
    }
    
    func collectionView(collectionView:UICollectionView, cellForItemAtIndexPath indexPath:NSIndexPath) -> UICollectionViewCell
    {
        let item:MHistoryItemComponent = modelAtIndex(indexPath)
        let cell:VHistoryChartCell = collectionView.dequeueReusableCellWithReuseIdentifier(
            item.reusableIdentifier,
            forIndexPath:
            indexPath) as! VHistoryChartCell
        item.config(cell)
        
        return cell
    }
}