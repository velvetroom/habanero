import UIKit

extension ControllerHome
{
    //MARK: private
    
    private func filtersUpdated()
    {
        let rect:CGRect = CGRect(
            x:0,
            y:0,
            width:1,
            height:1)
        
        self.viewMain.viewList.collectionView.reloadData()
        
        self.viewMain.viewList.collectionView.scrollRectToVisible(
            rect,
            animated:true)
    }
    
    private func animateFilterTo(position:CGFloat)
    {
        self.viewMain.layoutFilterTop.constant = position
        
        UIView.animate(withDuration:ViewGlobal.Constants.animationDuration)
        { [weak self] in
            
            self?.viewMain.layoutIfNeeded()
        }
    }
    
    //MARK: internal
    
    func updateFilters()
    {
        self.model.updateFilters
        { [weak self] in
            
            self?.filtersUpdated()
        }
    }
    
    func toggleFilter()
    {
        self.model.filterState.toggleState(self)()
    }
    
    func showFilter()
    {
        self.viewMain.viewBar.showFilters()
        self.animateFilterTo(position:0)
        self.model.updateFilterState(filterStateType:HomeFilterStateVisible.self)
    }
    
    func hideFilter()
    {
        self.viewMain.viewBar.hideFilters()
        self.animateFilterTo(position:-ViewHome.Constants.filterHeight)
        self.model.updateFilterState(filterStateType:HomeFilterStateHidden.self)
    }
    
    func configFilterShow(viewCell:ViewHomeFilterListCellShow)
    {
        
    }
    
    func configFilterOrder(viewCell:ViewHomeFilterListCellOrder)
    {
        
    }
    
    func filterOrderByDate()
    {
        
    }
    
    func filterOrderByFavourites()
    {
        
    }
}
