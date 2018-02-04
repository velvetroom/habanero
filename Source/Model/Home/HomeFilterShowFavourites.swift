import Foundation

struct HomeFilterShowFavourites:HomeFilterShowProtocol
{
    func filter(items:[CookItem]) -> [CookItem]
    {
        var filtered:[CookItem] = []
        
        for item:CookItem in items
        {
            if item.favourite is CookItemFavouriteOn
            {
                filtered.append(item)
            }
        }
        
        return filtered
    }
}
