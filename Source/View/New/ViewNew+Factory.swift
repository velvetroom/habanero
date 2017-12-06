import UIKit

extension ViewNew
{
    //MARK: internal
    
    func factoryViews()
    {
        let viewBar:ViewNewBar = ViewNewBar(controller:controller)
        
        let viewList:ViewNewList = ViewNewList(controller:controller)
        self.viewList = viewList
        
        addSubview(viewList)
        addSubview(viewBar)
        
        NSLayoutConstraint.topToTop(
            view:viewBar,
            toView:self)
        NSLayoutConstraint.height(
            view:viewBar,
            constant:ViewGlobal.Constants.contentTop)
        NSLayoutConstraint.equalsHorizontal(
            view:viewBar,
            toView:self)
        
        NSLayoutConstraint.equals(
            view:viewList,
            toView:self)
    }
}
