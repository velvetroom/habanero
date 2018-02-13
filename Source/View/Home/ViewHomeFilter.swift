import UIKit

final class ViewHomeFilter:View<ArchHome>
{
    private(set) weak var layoutSearchWidth:NSLayoutConstraint!
    
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
        NSLayoutConstraint.rightToRight(
            view:viewSearch,
            toView:self)
        self.layoutSearchWidth = NSLayoutConstraint.width(
            view:viewSearch,
            constant:ViewHomeFilter.Constants.searchMinWidth)
        
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
