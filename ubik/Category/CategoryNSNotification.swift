import Foundation

extension NSNotification
{
    class func observeBecameActive(receiver:AnyObject, sel:Selector)
    {
        NSNotificationCenter.defaultCenter().addObserver(receiver, selector:sel, name:becameActiveName(), object:nil)
    }
    
    class func postBecameActive()
    {
        NSNotificationCenter.defaultCenter().postNotificationName(becameActiveName(), object:nil)
    }
    
    //MARK: private
    
    private class func becameActiveName() -> String
    {
        return "becameActive"
    }
}