import UIKit

final class ViewNewAddIngredientBar:ViewBarBack<ArchNewAddIngredient>, UISearchBarDelegate
{
    private(set) weak var searchBar:UISearchBar!
    
    override func factoryViews()
    {
        super.factoryViews()
        
        let searchBar:UISearchBar = UISearchBar(frame:CGRect.zero)
        searchBar.translatesAutoresizingMaskIntoConstraints = false
        searchBar.backgroundColor = UIColor.clear
        searchBar.searchBarStyle = UISearchBarStyle.minimal
        searchBar.showsCancelButton = true
        searchBar.tintColor = UIColor.colourBackgroundDark
        searchBar.delegate = self
        self.searchBar = searchBar
        
        self.addSubview(searchBar)
        
        NSLayoutConstraint.topToTop(
            view:searchBar,
            toView:self,
            constant:ViewNewAddIngredientBar.Constants.barTop)
        NSLayoutConstraint.bottomToBottom(
            view:searchBar,
            toView:self)
        NSLayoutConstraint.leftToLeft(
            view:searchBar,
            toView:self,
            constant:ViewNewAddIngredientBar.Constants.barLeft)
        NSLayoutConstraint.rightToRight(
            view:searchBar,
            toView:self)
    }
    
    override func selectorButtonBack(sender button:UIButton)
    {
        self.controller.transitionBack()
    }
}
