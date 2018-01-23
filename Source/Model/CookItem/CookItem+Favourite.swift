import Foundation

extension CookItem
{
    //MARK: private
    
    private class func asyncAddFavouriteItem(
        cookItem:CookItem,
        completion:@escaping(() -> ()))
    {
        favouriteItemUpdated(
            cookItem:cookItem,
            favouriteType:CookItemFavouriteOn.self,
            completion:completion)
    }
    
    private class func asyncRemoveFavouriteItem(
        cookItem:CookItem,
        completion:@escaping(() -> ()))
    {
        favouriteItemUpdated(
            cookItem:cookItem,
            favouriteType:CookItemFavouriteOff.self,
            completion:completion)
    }
    
    private class func favouriteItemUpdated(
        cookItem:CookItem,
        favouriteType:CookItemFavouriteProtocol.Type,
        completion:@escaping(() -> ()))
    {
        cookItem.favourite = favouriteType
        
        DispatchQueue.main.async
        {
            completion()
        }
    }
    
    //MARK: internal
    
    class func showFavouriteSelected(viewFavourite:ViewCookFavourite)
    {
        viewFavourite.isSelected = true
    }
    
    class func showFavouriteNotSelected(viewFavourite:ViewCookFavourite)
    {
        viewFavourite.isSelected = false
    }
    
    class func addFavouriteItem(
        cookItem:CookItem,
        completion:@escaping(() -> ()))
    {
        DispatchQueue.global(qos:DispatchQoS.QoSClass.background).async
        {
            CookItem.asyncAddFavouriteItem(
                cookItem:cookItem,
                completion:completion)
        }
    }
    
    class func removeFavouriteItem(
        cookItem:CookItem,
        completion:@escaping(() -> ()))
    {
        DispatchQueue.global(qos:DispatchQoS.QoSClass.background).async
        {
            CookItem.asyncRemoveFavouriteItem(
                cookItem:cookItem,
                completion:completion)
        }
    }
}
