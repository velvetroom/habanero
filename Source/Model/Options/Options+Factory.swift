import Foundation

extension Options
{
    //MARK: internal
    
    class func factoryItems() -> [OptionsItemProtocol]
    {
        let itemMetrics:OptionsItemMetrics = OptionsItemMetrics()
        
        let items:[OptionsItemProtocol] = [
            itemMetrics]
        
        return items
    }
}
