import Foundation

extension Menu
{
    //MARK: internal
    
    class func factoryItems() -> [MenuItemProtocol]
    {
        var items:[MenuItemProtocol] = factoryItemsList()
        
        items.sort
        { (itemA:MenuItemProtocol, itemB:MenuItemProtocol) -> Bool in
            
            return itemA.order.rawValue < itemB.order.rawValue
        }
        
        return items
    }
    
    class func factoryItemsMap(items:[MenuItemProtocol]) -> [Menu.Order:MenuItemProtocol]
    {
        var map:[Menu.Order:MenuItemProtocol] = [:]
        
        for item:MenuItemProtocol in items
        {
            map[item.order] = item
        }
        
        return map
    }
}
