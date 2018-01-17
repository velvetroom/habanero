import UIKit

final class ViewCookStep:ViewMain<ArchCookStep>
{
    private(set) weak var viewProgress:ViewCookStepProgress!
    
    override func factoryViews()
    {
        super.factoryViews()
        
        let viewBar:ViewCookStepBar = ViewCookStepBar(controller:self.controller)
        
        let viewList:ViewCookStepList = ViewCookStepList(controller:self.controller)
        
        let viewProgress:ViewCookStepProgress = ViewCookStepProgress(controller:self.controller)
        self.viewProgress = viewProgress
        
        self.addSubview(viewList)
        self.addSubview(viewProgress)
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

        NSLayoutConstraint.height(
            view:viewProgress,
            constant:ViewCookStep.Constants.progressHeight)
        NSLayoutConstraint.bottomToBottom(
            view:viewProgress,
            toView:self)
        NSLayoutConstraint.equalsHorizontal(
            view:viewProgress,
            toView:self)
    }
}
