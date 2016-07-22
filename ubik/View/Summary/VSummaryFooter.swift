import UIKit

class VSummaryFooter:UIView, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout
{
    weak var controller:CSummary!
    weak var collection:UICollectionView!
    private var model:MSummary?
    private var cellSize:CGSize?
    
    init(controller:CSummary)
    {
        super.init(frame:CGRectZero)
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
    
    required init?(coder:NSCoder)
    {
        fatalError()
    }
    
    //MARK: private
    
    private func modelAtIndex(index:NSIndexPath) -> MSummaryItem
    {
        let item:MSummaryItem = model!.items[index.item]
        
        return item
    }
    
    //MARK: public
    
    func update()
    {
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND, 0))
        { [weak self] in
            
            self?.cellSize = nil
            self?.model = MSummary()
            
            dispatch_async(dispatch_get_main_queue())
            { [weak self] in
                
                self?.collection.reloadData()
            }
        }
    }
    
    //MARK: collection del
    
    func collectionView(collectionView:UICollectionView, layout collectionViewLayout:UICollectionViewLayout, sizeForItemAtIndexPath indexPath:NSIndexPath) -> CGSize
    {
        if cellSize == nil
        {
            let width:CGFloat = collectionView.bounds.maxX
            let height:CGFloat = collectionView.bounds.maxY
            let items:CGFloat = CGFloat(model!.items.count)
            let heightItem:CGFloat = height / items
            cellSize = CGSizeMake(width, heightItem)
        }
        
        return cellSize!
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
            count = model!.items.count
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
        let item:MSummaryItem = modelAtIndex(indexPath)
        let cell:VSummaryFooterCell = collectionView.dequeueReusableCellWithReuseIdentifier(
            VSummaryFooterCell.reusableIdentifier(),
            forIndexPath:
            indexPath) as! VSummaryFooterCell
        cell.config(item)
        
        return cell
    }
}