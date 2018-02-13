import UIKit

final class ViewHomeFilter:View<ArchHome>
{
    override func factoryViews()
    {
        super.factoryViews()
        self.backgroundColor = UIColor.white
        
        let viewBorder:ViewBorder = ViewBorder(colour:UIColor(white:0, alpha:0.2))
        
        let viewList:ViewHomeFilterList = ViewHomeFilterList(controller:self.controller)
        
        let viewSearch:ViewHomeFilterSearch = ViewHomeFilterSearch(controller:self.controller)
        
        self.addSubview(viewBorder)
        self.addSubview(viewList)
        self.addSubview(viewSearch)
        
        NSLayoutConstraint.height(
            view:viewBorder,
            constant:ViewGlobal.Constants.borderWidth)
        NSLayoutConstraint.bottomToBottom(
            view:viewBorder,
            toView:self)
        NSLayoutConstraint.equalsHorizontal(
            view:viewBorder,
            toView:self)
        
        NSLayoutConstraint.topToTop(
            view:viewSearch,
            toView:self)
        NSLayoutConstraint.height(
            view:viewSearch,
            constant:ViewHomeFilter.Constants.searchHeight)
        NSLayoutConstraint.equalsHorizontal(
            view:viewSearch,
            toView:self)
        
        NSLayoutConstraint.topToBottom(
            view:viewList,
            toView:viewSearch)
        NSLayoutConstraint.bottomToBottom(
            view:viewList,
            toView:self)
        NSLayoutConstraint.equalsHorizontal(
            view:viewList,
            toView:self)
    }
}
