import UIKit

extension ControllerHome
{
    //MARK: internal
    
    func filterShowToggle(viewCell:ViewHomeFilterListCellShow)
    {
        self.model.filter.show.toggleFilter(self)(viewCell)
    }
    
    func filterShowAll(viewCell:ViewHomeFilterListCellShow)
    {
        self.model.filter.show = HomeFilterShowAll()
        viewCell.showAll()
        
        self.updateFilters()
    }
    
    func filterShowFavourites(viewCell:ViewHomeFilterListCellShow)
    {
        self.model.filter.show = HomeFilterShowFavourites()
        viewCell.showOnlyFavourites()
        
        self.updateFilters()
    }
}
