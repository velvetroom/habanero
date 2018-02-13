import UIKit

final class ViewHomeFilterSearch:View<ArchHome>
{
    private weak var searchBar:UISearchBar!
    
    override func factoryViews()
    {
        super.factoryViews()
        
        let searchBar:UISearchBar = UISearchBar(frame:CGRect.zero)
        searchBar.translatesAutoresizingMaskIntoConstraints = false
        searchBar.backgroundColor = UIColor.clear
        searchBar.searchBarStyle = UISearchBarStyle.minimal
        searchBar.showsCancelButton = false
        searchBar.tintColor = UIColor.colourBackgroundDark
        searchBar.delegate = self.controller
        self.searchBar = searchBar
        
        self.addSubview(searchBar)
        
        NSLayoutConstraint.equals(
            view:searchBar,
            toView:self)
    }
}
