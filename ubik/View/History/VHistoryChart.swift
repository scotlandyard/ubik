import UIKit

class VHistoryChart:UIView, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout
{
    weak var controller:CHistory!
    weak var collection:UICollectionView!
    weak var selector:VHistoryChartSelector!
    weak var touch:VHistoryChartTouch!
    weak var display:VHistoryChartDisplay!
    private weak var layoutSelectorLeft:NSLayoutConstraint!
    private(set) var selectorX:CGFloat
    private let selectorWidth_2:CGFloat
    private let kCellWidth:CGFloat = 20
    private let kCollectionHeight:CGFloat = 50
    private let kSelectorTop:CGFloat = 50
    private let kSelectorWidth:CGFloat = 50
    private let kSelectorHeight:CGFloat = 72
    private let kTouchHeight:CGFloat = 150
    private let kSelectorAnimationDuration:NSTimeInterval = 0.25
    private let kReloadDelay:UInt64 = 300
    
    init(controller:CHistory)
    {
        selectorWidth_2 = kSelectorWidth / 2.0
        selectorX = 0
        
        super.init(frame:CGRectZero)
        self.controller = controller
        translatesAutoresizingMaskIntoConstraints = false
        clipsToBounds = true
        
        let selector:VHistoryChartSelector = VHistoryChartSelector()
        self.selector = selector
        
        let touch:VHistoryChartTouch = VHistoryChartTouch(chart:self)
        self.touch = touch
        
        let display:VHistoryChartDisplay = VHistoryChartDisplay()
        self.display = display
        
        let borderBottom:UIView = UIView()
        borderBottom.userInteractionEnabled = false
        borderBottom.translatesAutoresizingMaskIntoConstraints = false
        borderBottom.backgroundColor = UIColor.blackColor()
        
        let borderTop:UIView = UIView()
        borderTop.userInteractionEnabled = false
        borderTop.translatesAutoresizingMaskIntoConstraints = false
        borderTop.backgroundColor = UIColor.blackColor()
        
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
        addSubview(collection)
        addSubview(touch)
        addSubview(display)
        addSubview(selector)
        
        let views:[String:AnyObject] = [
            "collection":collection,
            "borderBottom":borderBottom,
            "borderTop":borderTop,
            "touch":touch,
            "display":display,
            "selector":selector]
        
        let metrics:[String:AnyObject] = [
            "collectionHeight":kCollectionHeight,
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
            "H:|-0-[display]-0-|",
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
            "V:|-0-[borderTop(1)]-0-[collection(collectionHeight)]-0-[borderBottom(2)]-0-[touch(touchHeight)]",
            options:[],
            metrics:metrics,
            views:views))
        addConstraints(NSLayoutConstraint.constraintsWithVisualFormat(
            "V:[borderBottom]-0-[display]-0-|",
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
        
        selectorX = maxWidth / 2.0
        layoutSelectorLeft.constant = margin
    }
    
    private func modelAtIndex(index:NSIndexPath) -> MHistoryItem
    {
        let item:MHistoryItem = controller.model!.items[index.item]
        
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
    
    private func hikeAt()
    {
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND, 0))
        { [weak self] in
            
            if self != nil
            {
                let scrollX:CGFloat = self!.collection.contentOffset.x
                let totalX:CGFloat = self!.selectorX + scrollX
                let point:CGPoint = CGPointMake(totalX, 1)
                let index:NSIndexPath? = self!.collection.indexPathForItemAtPoint(point)
                
                if index != nil
                {
                    let item:MHistoryItem = self!.modelAtIndex(index!)
                    
                    dispatch_async(dispatch_get_main_queue())
                    { [weak self] in
                        
                        self?.display.hikeSelected(item)
                        self?.collection.selectItemAtIndexPath(index, animated:false, scrollPosition:UICollectionViewScrollPosition.None)
                    }
                }
            }
        }
    }
    
    //MARK: public
    
    func reload()
    {
        collection.reloadData()
        
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, Int64(NSEC_PER_MSEC * kReloadDelay)), dispatch_get_main_queue())
        { [weak self] in
            
            self?.hikeAt()
        }
    }
    
    func touching(left:CGFloat)
    {
        selectorX = left
        let realX:CGFloat = left - selectorWidth_2
        animateSelector(realX)
        
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND, 0))
        { [weak self] in
            
            self?.hikeAt()
        }
    }
    
    //MARK: col del
    
    func scrollViewDidScroll(scrollView:UIScrollView)
    {
        hikeAt()
    }
    
    func numberOfSectionsInCollectionView(collectionView:UICollectionView) -> Int
    {
        let count:Int

        if controller.model == nil
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
        let count:Int = controller.model!.items.count
        
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
    
    func collectionView(collectionView:UICollectionView, shouldHighlightItemAtIndexPath indexPath:NSIndexPath) -> Bool
    {
        return false
    }
    
    func collectionView(collectionView:UICollectionView, shouldSelectItemAtIndexPath indexPath:NSIndexPath) -> Bool
    {
        return false
    }
}