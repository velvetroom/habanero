import Foundation

struct HomeFilterOrderDate:HomeFilterOrderProtocol
{
    //MARK: internal
    
    func filter(items:[CookItem]) -> [CookItem]
    {
        var items:[CookItem] = items
        
        items.sort
        { (itemA:CookItem, itemB:CookItem) -> Bool in
            
            return itemA.recipe.created > itemB.recipe.created
        }
        
        return items
    }
}
