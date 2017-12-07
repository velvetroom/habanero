import UIKit

extension ViewNewAdd
{
    //MARK: internal
    
    func factoryViews()
    {
        let viewBar:ViewNewAddBar = ViewNewAddBar(controller:controller)
        
        self.addSubview(viewBar)
        
        NSLayoutConstraint.topToTop(
            view:viewBar,
            toView:self)
        NSLayoutConstraint.height(
            view:viewBar,
            constant:ViewGlobal.Constants.barHeight)
        NSLayoutConstraint.equalsHorizontal(
            view:viewBar,
            toView:self)
    }
}
