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
    
    func filterOrderByDate()
    {
        
    }
    
    func filterOrderByFavourites()
    {
        
    }
}
