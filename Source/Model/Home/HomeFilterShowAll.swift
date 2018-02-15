import Foundation

struct HomeFilterShowAll:HomeFilterShowProtocol
{
    let toggleFilter:((ControllerHome) -> (ViewHomeFilterListCellShow) -> ()) = ControllerHome.filterShowFavourites
    
    //MARK: internal
    
    func filter(items:[CookItem]) -> [CookItem]
    {
        return items
    }
}
