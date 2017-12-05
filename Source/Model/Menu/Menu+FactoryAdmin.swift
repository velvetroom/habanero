import Foundation

extension Menu
{
    //MARK: internal
    
    class func factoryItemsList() -> [MenuItemProtocol]
    {
        let itemHome:MenuItemHome = MenuItemHome()
        
        let map:[MenuItemProtocol] = [
            itemHome]
        
        return map
    }
}
