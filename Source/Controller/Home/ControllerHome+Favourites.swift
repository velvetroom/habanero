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
        let analytics:Analytics = Analytics()
        analytics.unfavouriteRecipe(recipe:recipe)
    }
    
    private static func favouriteSetOn(recipe:Recipe)
    {
        let analytics:Analytics = Analytics()
        analytics.favouriteRecipe(recipe:recipe)
    }
    
    private func favouriteEvent(cookItem:CookItem)
    {
        guard
        
            let router:((Recipe) -> ()) = ControllerHome.favouriteMap[cookItem.favourite.type]
        
        else
        {
            return
        }
        
        router(cookItem.recipe)
    }
    
    //MARK: internal
    
    func favouriteItem(
        cookItem:CookItem,
        completion:@escaping(() -> ()))
    {
        let database:Database = self.model.database
        
        self.favouriteEvent(cookItem:cookItem)
        cookItem.favourite.selected(
            cookItem,
            self.model.cloud,
            database,
            completion)
    }
}
