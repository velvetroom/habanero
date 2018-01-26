import Foundation

extension CookItem
{
    //MARK: private
    
    private class func asyncAddFavouriteItem(
        cookItem:CookItem,
        cloud:Cloud,
        database:Database,
        completion:@escaping(() -> ()))
    {
        cloud.addToFavourites(recipe:cookItem.recipe)
        { (error:Error?) in
            
            guard
            
                error == nil
            
            else
            {
                return
            }
            
            CookItem.createFavourite(
                cookItem:cookItem,
                database:database,
                completion:completion)
        }
    }
    
    private class func asyncRemoveFavouriteItem(
        cookItem:CookItem,
        cloud:Cloud,
        database:Database,
        completion:@escaping(() -> ()))
    {
        cloud.removeFromFavourites(recipe:cookItem.recipe)
        { (error:Error?) in
            
            guard
                
                error == nil
                
            else
            {
                return
            }
            
            CookItem.removeFavourite(
                cookItem:cookItem,
                database:database,
                completion:completion)
        }
    }
    
    private class func createFavourite(
        cookItem:CookItem,
        database:Database,
        completion:@escaping(() -> ()))
    {
        database.create
        { (favourite:RecipeFavourite) in
            
            favourite.recipeIdentifier = cookItem.recipe.identifier
            database.save(completion:nil)
            
            favouriteItemUpdated(
                cookItem:cookItem,
                favouriteType:CookItemFavouriteOn.self,
                completion:completion)
        }
    }
    
    private class func removeFavourite(
        cookItem:CookItem,
        database:Database,
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
    
    private class func configureFavourite(
        cookItem:CookItem,
        viewFavourite:ViewCookFavourite)
    {
        let amount:String = String(cookItem.recipe.favourites)
        viewFavourite.labelAmount.text = amount
    }
    
    //MARK: internal
    
    class func showFavouriteSelected(
        cookItem:CookItem,
        viewFavourite:ViewCookFavourite)
    {
        viewFavourite.isSelected = true
    }
    
    class func showFavouriteNotSelected(
        cookItem:CookItem,
        viewFavourite:ViewCookFavourite)
    {
        viewFavourite.isSelected = false
        
        CookItem.configureFavourite(
            cookItem:cookItem,
            viewFavourite:viewFavourite)
    }
    
    class func addFavouriteItem(
        cookItem:CookItem,
        cloud:Cloud,
        database:Database,
        completion:@escaping(() -> ()))
    {
        DispatchQueue.global(qos:DispatchQoS.QoSClass.background).async
        {
            CookItem.asyncAddFavouriteItem(
                cookItem:cookItem,
                cloud:cloud,
                database:database,
                completion:completion)
        }
    }
    
    class func removeFavouriteItem(
        cookItem:CookItem,
        cloud:Cloud,
        database:Database,
        completion:@escaping(() -> ()))
    {
        DispatchQueue.global(qos:DispatchQoS.QoSClass.background).async
        {
            CookItem.asyncRemoveFavouriteItem(
                cookItem:cookItem,
                cloud:cloud,
                database:database,
                completion:completion)
        }
    }
}
