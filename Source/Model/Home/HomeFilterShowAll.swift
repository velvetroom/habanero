import Foundation

struct HomeFilterShowAll:HomeFilterShowProtocol
{
    //MARK: internal
    
    func filter(items:[CookItem]) -> [CookItem]
    {
        return items
    }
}
