import Foundation

extension Menu
{
    static var itemsListType:[MenuItemProtocol.Type]
    {
        get
        {
            let list:[MenuItemProtocol.Type] = [
                MenuItemOptions.self,
                MenuItemHome.self]
            
            return list
        }
    }
}
