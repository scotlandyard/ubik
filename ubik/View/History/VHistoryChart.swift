import UIKit

class VHistoryChart:UIView, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout
{
    var model:MHistory?
    weak var collection:UICollectionView!
    weak var selector:VHistoryChartSelector!
    weak var touch:VHistoryChartTouch!
    private weak var layoutSelectorLeft:NSLayoutConstraint!
    private let selectorWidth_2:CGFloat
    private let kCellWidth:CGFloat = 10
    private let kCollectionHeight:CGFloat = 50
    private let kCollectionBaseHeight:CGFloat = 2
    private let kSelectorWidth:CGFloat = 30
    private let kSelectorTop:CGFloat = 35
    private let kSelectorHeight:CGFloat = 70
    private let kTouchHeight:CGFloat = 150
    private let kSelectorAnimationDuration:NSTimeInterval = 0.3
    
    init()
    {
        selectorWidth_2 = kSelectorWidth / 2.0
        
        super.init(frame:CGRectZero)
        translatesAutoresizingMaskIntoConstraints = false
        clipsToBounds = true
        
        let selector:VHistoryChartSelector = VHistoryChartSelector()
        self.selector = selector
        
        let touch:VHistoryChartTouch = VHistoryChartTouch(chart:self)
        self.touch = touch
        
        let borderBottom:UIView = UIView()
        borderBottom.userInteractionEnabled = false
        borderBottom.translatesAutoresizingMaskIntoConstraints = false
        borderBottom.backgroundColor = UIColor.blackColor()
        
        let borderTop:UIView = UIView()
        borderTop.userInteractionEnabled = false
        borderTop.translatesAutoresizingMaskIntoConstraints = false
        borderTop.backgroundColor = UIColor.blackColor()
        
        let base:UIView = UIView()
        base.backgroundColor = UIColor.main()
        base.userInteractionEnabled = false
        base.translatesAutoresizingMaskIntoConstraints = false
        
        let flow:UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        flow.headerReferenceSize = CGSizeZero
        flow.footerReferenceSize = CGSizeZero
        flow.minimumLineSpacing = 0
        flow.minimumInteritemSpacing = 0
        flow.itemSize = CGSizeMake(kCellWidth, kCollectionHeight)
        flow.sectionInset = UIEdgeInsetsZero
        flow.scrollDirection = UICollectionViewScrollDirection.Horizontal
        
        let collection:UICollectionView = UICollectionView(frame:CGRectZero, collectionViewLayout:flow)
        collection.clipsToBounds = true
        collection.translatesAutoresizingMaskIntoConstraints = false
        collection.backgroundColor = UIColor.clearColor()
        collection.showsVerticalScrollIndicator = false
        collection.showsHorizontalScrollIndicator = false
        collection.alwaysBounceHorizontal = true
        collection.dataSource = self
        collection.delegate = self
        collection.registerClass(
            VHistoryChartCell.self,
            forCellWithReuseIdentifier:
            VHistoryChartCell.reusableIdentifier())
        self.collection = collection
        
        addSubview(borderBottom)
        addSubview(borderTop)
        addSubview(base)
        addSubview(collection)
        addSubview(touch)
        addSubview(selector)
        
        let views:[String:AnyObject] = [
            "collection":collection,
            "base":base,
            "borderBottom":borderBottom,
            "borderTop":borderTop,
            "touch":touch,
            "selector":selector]
        
        let metrics:[String:AnyObject] = [
            "collectionHeight":kCollectionHeight,
            "baseHeight":kCollectionBaseHeight,
            "selectorWidth":kSelectorWidth,
            "selectorHeight":kSelectorHeight,
            "selectorTop":kSelectorTop,
            "touchHeight":kTouchHeight]
        
        addConstraints(NSLayoutConstraint.constraintsWithVisualFormat(
            "H:|-0-[collection]-0-|",
            options:[],
            metrics:metrics,
            views:views))
        addConstraints(NSLayoutConstraint.constraintsWithVisualFormat(
            "H:|-0-[touch]-0-|",
            options:[],
            metrics:metrics,
            views:views))
        addConstraints(NSLayoutConstraint.constraintsWithVisualFormat(
            "H:|-0-[base]-0-|",
            options:[],
            metrics:metrics,
            views:views))
        addConstraints(NSLayoutConstraint.constraintsWithVisualFormat(
            "H:|-0-[borderBottom]-0-|",
            options:[],
            metrics:metrics,
            views:views))
        addConstraints(NSLayoutConstraint.constraintsWithVisualFormat(
            "H:|-0-[borderTop]-0-|",
            options:[],
            metrics:metrics,
            views:views))
        addConstraints(NSLayoutConstraint.constraintsWithVisualFormat(
            "V:|-0-[borderTop(1)]-0-[collection(collectionHeight)]-0-[base(baseHeight)]-0-[borderBottom(1)]-0-[touch(touchHeight)]",
            options:[],
            metrics:metrics,
            views:views))
        addConstraints(NSLayoutConstraint.constraintsWithVisualFormat(
            "H:[selector(selectorWidth)]",
            options:[],
            metrics:metrics,
            views:views))
        addConstraints(NSLayoutConstraint.constraintsWithVisualFormat(
            "V:|-(selectorTop)-[selector(selectorHeight)]",
            options:[],
            metrics:metrics,
            views:views))
        
        layoutSelectorLeft = NSLayoutConstraint(
            item:selector,
            attribute:NSLayoutAttribute.Left,
            relatedBy:NSLayoutRelation.Equal,
            toItem:self,
            attribute:NSLayoutAttribute.Left,
            multiplier:1,
            constant:0)
        
        addConstraint(layoutSelectorLeft)
        
        centerSelector()
    }
    
    required init?(coder:NSCoder)
    {
        fatalError()
    }
    
    //MARK: private
    
    private func centerSelector()
    {
        let maxWidth:CGFloat = UIScreen.mainScreen().bounds.maxX
        let remain:CGFloat = maxWidth - kSelectorWidth
        let margin:CGFloat = remain / 2.0
        
        animateSelector(margin)
    }
    
    private func modelAtIndex(index:NSIndexPath) -> MHistoryItem
    {
        let item:MHistoryItem = model!.items[index.item]
        
        return item
    }
    
    private func animateSelector(left:CGFloat)
    {
        layoutSelectorLeft.constant = left
        
        UIView.animateWithDuration(kSelectorAnimationDuration)
        { [weak self] in
            
            self?.layoutIfNeeded()
        }
    }
    
    private func hikeAt(left:CGFloat)
    {
        let point:CGPoint = CGPointMake(left, 1)
        let index:NSIndexPath? = collection.indexPathForItemAtPoint(point)
        
        if index != nil
        {
            let item:MHistoryItem = modelAtIndex(index!)
            
        }
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
    
    func touching(left:CGFloat)
    {
        let realX:CGFloat = left - selectorWidth_2
        animateSelector(realX)
        
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND, 0))
        { [weak self] in
            
            self?.hikeAt(left)
        }
    }
    
    //MARK: col del
    
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
        let item:MHistoryItem = modelAtIndex(indexPath)
        let cell:VHistoryChartCell = collectionView.dequeueReusableCellWithReuseIdentifier(
            VHistoryChartCell.reusableIdentifier(),
            forIndexPath:
            indexPath) as! VHistoryChartCell
        cell.config(item)
        
        return cell
    }
}