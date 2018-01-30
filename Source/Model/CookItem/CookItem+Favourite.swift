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
        database.createRecipeFavourite(identifier:cookItem.recipe.identifier)
        { (favourite:RecipeFavourite) in
            
            let favouriteOn:CookItemFavouriteOn = CookItemFavouriteOn(recipeFavourite:favourite)
            
            CookItem.favouriteItemUpdated(
                cookItem:cookItem,
                favourite:favouriteOn,
                completion:completion)
        }
    }
    
    private class func removeFavourite(
        cookItem:CookItem,
        database:Database,
        completion:@escaping(() -> ()))
    {
        let favouriteOff:CookItemFavouriteOff = CookItemFavouriteOff()
        
        CookItem.favouriteItemUpdated(
            cookItem:cookItem,
            favourite:favouriteOff,
            completion:completion)
    }
    
    private class func favouriteItemUpdated(
        cookItem:CookItem,
        favourite:CookItemFavouriteProtocol,
        completion:@escaping(() -> ()))
    {
        cookItem.favourite = favourite
        
        DispatchQueue.main.async
        {
            completion()
        }
    }
    
    private class func configureFavourite(
        cookItem:CookItem,
        viewFavourite:ViewCookFavourite)
    {
        var numeric:Int = cookItem.recipe.favourites
        
        if numeric < 0
        {
            numeric = 0
        }
        
        let amount:String = String(cookItem.recipe.favourites)
        viewFavourite.labelAmount.text = amount
    }
    
    //MARK: internal
    
    class func showFavouriteSelected(
        cookItem:CookItem,
        viewFavourite:ViewCookFavourite)
    {
        viewFavourite.isSelected = true
        
        CookItem.configureFavourite(
            cookItem:cookItem,
            viewFavourite:viewFavourite)
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
        cookItem.recipe.favourites += 1
        
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
        cookItem.recipe.favourites -= 1
        
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
