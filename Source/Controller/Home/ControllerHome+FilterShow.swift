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
    }
    
    func filterShowFavourites(viewCell:ViewHomeFilterListCellShow)
    {
    }
}
