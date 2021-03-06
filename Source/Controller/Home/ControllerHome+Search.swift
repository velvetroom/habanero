import UIKit

extension ControllerHome
{
    private var searchMaxWidth:CGFloat
    {
        get
        {
            let viewWidth:CGFloat = self.viewMain.bounds.width
            
            return viewWidth
        }
    }
    
    //MARK: private
    
    private func animateSearchBar()
    {
        UIView.animate(withDuration:ViewGlobal.Constants.animationDuration)
        { [weak self] in
            
            self?.viewMain.viewFilter.layoutIfNeeded()
        }
    }
    
    //MARK: internal
    
    func animateShowSearch()
    {
        self.viewMain.viewFilter.layoutSearchWidth.constant = self.searchMaxWidth
        self.viewMain.viewFilter.viewSearch.searchBar.showsCancelButton = true
        self.animateSearchBar()
    }
    
    func animateHideSearch()
    {
        self.viewMain.viewFilter.layoutSearchWidth.constant = ViewHomeFilter.Constants.searchMinWidth
        self.viewMain.viewFilter.viewSearch.searchBar.showsCancelButton = false
        self.viewMain.viewFilter.viewSearch.searchBar.text = String()
        self.animateSearchBar()
    }
}
