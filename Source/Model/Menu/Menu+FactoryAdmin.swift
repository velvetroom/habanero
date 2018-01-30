import Foundation

extension Menu
{
    static var itemsListType:[MenuItemProtocol.Type]
    {
        get
        {
            let list:[MenuItemProtocol.Type] = [
                MenuItemOptions.self,
                MenuItemHome.self,
                MenuItemNew.self]
            
            return list
        }
    }
}
