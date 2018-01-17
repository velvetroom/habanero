import UIKit

final class ViewCookStep:ViewMain<ArchCookStep>
{
    override func factoryViews()
    {
        super.factoryViews()
        
        let viewBar:ViewCookStepBar = ViewCookStepBar(controller:self.controller)
        
        let viewList:ViewCookStepList = ViewCookStepList(controller:self.controller)
        
        self.addSubview(viewList)
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
        
        NSLayoutConstraint.topToBottom(
            view:viewList,
            toView:viewBar)
        NSLayoutConstraint.bottomToBottom(
            view:viewList,
            toView:self)
        NSLayoutConstraint.equalsHorizontal(
            view:viewList,
            toView:self)
    }
}
