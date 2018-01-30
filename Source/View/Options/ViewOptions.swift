import UIKit

final class ViewOptions:ViewMain<ArchOptions>
{
    override func factoryViews()
    {
        super.factoryViews()
        
        let viewBar:ViewOptionsBar = ViewOptionsBar(controller:self.controller)
        
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
