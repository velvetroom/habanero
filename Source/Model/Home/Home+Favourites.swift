import Foundation

extension Home
{
    //MARK: private
    
    private func addFavouritesToRecipes(
        favouritesList:[RecipeFavourite],
        completion:@escaping(() -> ()))
    {
        for favourite:RecipeFavourite in favouritesList
        {
            guard
            
                let recipeIdentifier:String = favourite.recipeIdentifier,
                let cookItem:CookItem = self.recipesMap[recipeIdentifier]
                
            else
            {
                continue
            }
            
            cookItem.favourite = CookItemFavouriteOn.self
            cookItem.recipeFavourite = favourite
        }
        
        self.loadCompleted(completion:completion)
    }
    
    //MARK: internal
    
    func loadFavourites(completion:@escaping(() -> ()))
    {
        self.database.getFavourites
        { [weak self] (favouritesList:[RecipeFavourite]) in
            
            self?.addFavouritesToRecipes(
                favouritesList:favouritesList,
                completion:completion)
        }
    }
}
