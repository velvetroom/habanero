import UIKit

final class ViewCook:ViewMain<ArchCook>
{
    private weak var viewList:ViewCookList!
    private weak var layoutHeaderHeight:NSLayoutConstraint!
    
    override func factoryViews()
    {
        super.factoryViews()
        self.shouldPanBack = true
        
        let viewHeader:ViewCookHeader = ViewCookHeader(controller:self.controller)
        
        let viewList:ViewCookList = ViewCookList(controller:self.controller)
        self.viewList = viewList
        
        self.addSubview(viewList)
        self.addSubview(viewHeader)
        
        NSLayoutConstraint.equals(
            view:viewList,
            toView:self)
        
        NSLayoutConstraint.topToTop(
            view:viewHeader,
            toView:self)
        layoutHeaderHeight = NSLayoutConstraint.height(
            view:viewHeader)
        NSLayoutConstraint.equalsHorizontal(
            view:viewHeader,
            toView:self)
    }
    
    override func layoutSubviews()
    {
        self.adjustHeaderHeight()
        
        super.layoutSubviews()
    }
    
    //MARK: internal
    
    func adjustHeaderHeight()
    {
        let width:CGFloat = self.bounds.width
        
        layoutHeaderHeight.constant = width
    }
}
