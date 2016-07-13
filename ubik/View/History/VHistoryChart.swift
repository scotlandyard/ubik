import UIKit

class VHistoryChart:UIView, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout
{
    var model:MHistory?
    
    init()
    {
        super.init(frame:CGRectZero)
        translatesAutoresizingMaskIntoConstraints = false
        clipsToBounds = true
        
        
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
        {
            
        }
    }
    
    //MARK: col del
    
    func numberOfSectionsInCollectionView(collectionView:UICollectionView) -> Int
    {
        return 1
    }
    
    func collectionView(collectionView:UICollectionView, numberOfItemsInSection section:Int) -> Int
    {
        return 0
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