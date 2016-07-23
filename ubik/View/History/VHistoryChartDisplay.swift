import UIKit

class VHistoryChartDisplay:UIView, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout
{
    weak var collection:UICollectionView!
    weak var model:MHistoryItem?
    
    init()
    {
        super.init(frame:CGRectZero)
        userInteractionEnabled = false
        clipsToBounds = true
        translatesAutoresizingMaskIntoConstraints = false
        
        
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