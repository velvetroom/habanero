import Foundation

struct HomeFilterOrderFavourites:HomeFilterOrderProtocol
{
    //MARK: internal
    
    func filter(items:[CookItem]) -> [CookItem]
    {
        var items:[CookItem] = items
        
        items.sort
        { (itemA:CookItem, itemB:CookItem) -> Bool in
            
            return itemA.recipe.favourites > itemB.recipe.favourites
        }
        
        return items
    }
}
