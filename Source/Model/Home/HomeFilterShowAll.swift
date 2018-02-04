import Foundation

struct HomeFilterShowAll:HomeFilterShowProtocol
{
    func filter(items:[CookItem]) -> [CookItem]
    {
        return items
    }
}
