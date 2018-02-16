import Foundation
import UIKit

extension ControllerHome
{
    //MARK: internal
    
    func configFilterOrder(viewCell:ViewHomeFilterListCellOrder)
    {
        self.model.filter.order.configFilter(self)(viewCell)
    }
    
    func configFilterOrderByDate(viewCell:ViewHomeFilterListCellOrder)
    {
        viewCell.showOrderedByDate()
    }
    
    func configFilterOrderByFavourites(viewCell:ViewHomeFilterListCellOrder)
    {
        viewCell.showOrderedByFavourites()
    }
    
    func filterOrderByDate(viewCell:ViewHomeFilterListCellOrder)
    {
        self.model.filter.order = HomeFilterOrderDate()
        viewCell.showOrderedByDate()
        
        self.updateFilters()
    }
    
    func filterOrderByFavourites(viewCell:ViewHomeFilterListCellOrder)
    {
        self.model.filter.order = HomeFilterOrderFavourites()
        viewCell.showOrderedByFavourites()
        
        self.updateFilters()
    }
}
