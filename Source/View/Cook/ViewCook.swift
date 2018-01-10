import UIKit

final class ViewCook:ViewMain<ArchCook>
{
    private weak var layoutHeaderHeight:NSLayoutConstraint!
    
    override func factoryViews()
    {
        super.factoryViews()
        self.shouldPanBack = true
        
        let viewHeader:ViewCookHeader = ViewCookHeader(controller:self.controller)
        
        self.addSubview(viewHeader)
        
        NSLayoutConstraint.topToTop(
            view:viewHeader,
            toView:self)
        layoutHeaderHeight = NSLayoutConstraint.height(
            view:viewHeader)
        NSLayoutConstraint.equals(
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
