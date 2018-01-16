import UIKit

final class ViewCookStep:ViewMain<ArchCookStep>
{
    override func factoryViews()
    {
        super.factoryViews()
        
        let viewBar:ViewCookStepBar = ViewCookStepBar(controller:self.controller)
        
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
