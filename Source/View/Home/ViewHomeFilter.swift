import UIKit

final class ViewHomeFilter:View<ArchHome>
{
    private(set) weak var viewSearch:ViewHomeFilterSearch!
    private(set) weak var layoutSearchWidth:NSLayoutConstraint!
    
    override func factoryViews()
    {
        super.factoryViews()
        self.backgroundColor = UIColor.white
        
        let viewBorder:ViewBorder = ViewBorder(colour:UIColor(white:0, alpha:0.2))
        
        let viewList:ViewHomeFilterList = ViewHomeFilterList(controller:self.controller)
        
        let viewSearch:ViewHomeFilterSearch = ViewHomeFilterSearch(controller:self.controller)
        self.viewSearch = viewSearch
        
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
        
        NSLayoutConstraint.equalsVertical(
            view:viewSearch,
            toView:self)
        NSLayoutConstraint.rightToRight(
            view:viewSearch,
            toView:self)
        layoutSearchWidth = NSLayoutConstraint.width(
            view:viewSearch,
            constant:ViewHomeFilter.Constants.searchMinWidth)
        
        NSLayoutConstraint.equalsVertical(
            view:viewList,
            toView:self)
        NSLayoutConstraint.leftToLeft(
            view:viewList,
            toView:self)
        NSLayoutConstraint.rightToLeft(
            view:viewList,
            toView:viewSearch)
    }
}
