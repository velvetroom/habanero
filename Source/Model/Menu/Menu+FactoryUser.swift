import Foundation

extension Menu
{
    static var itemsListType:[MenuItemProtocol.Type]
    {
        get
        {
            let list:[MenuItemProtocol.Type] = [
                MenuItemHome.self,
                MenuItemFavourites.self]
            
            return list
        }
    }
}
