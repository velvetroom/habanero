import UIKit

extension ViewOptionsListCellMetrics
{
    //MARK: internal
    
    class func factorySegmentedItems() -> [String]
    {
        let itemInternational:String = String.localizedView(key:"ViewOptionsListCellMetrics_itemInternational")
        let itemUS:String = String.localizedView(key:"ViewOptionsListCellMetrics_itemUS")
        
        let items:[String] = [
            itemInternational,
            itemUS]
        
        return items
    }
}
