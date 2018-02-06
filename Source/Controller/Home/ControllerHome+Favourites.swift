import Foundation

extension ControllerHome
{
    private static var favouriteMap:[CookItemFavouriteType:((Recipe) -> ())]
    {
        get
        {
            let favouriteMap:[CookItemFavouriteType:((Recipe) -> ())] = [
                CookItemFavouriteType.on : ControllerHome.favouriteSetOff,
                CookItemFavouriteType.off : ControllerHome.favouriteSetOn]
            
            return favouriteMap
        }
    }
    
    //MARK: private
    
    private static func favouriteSetOff(recipe:Recipe)
    {
        
    }
    
    private static func favouriteSetOn(recipe:Recipe)
    {
        
    }
    
    //MARK: internal
    
    func favouriteItem(
        cookItem:CookItem,
        completion:@escaping(() -> ()))
    {
        let database:Database = self.model.database
        
        cookItem.favourite.selected(
            cookItem,
            self.model.cloud,
            database,
            completion)
    }
}
