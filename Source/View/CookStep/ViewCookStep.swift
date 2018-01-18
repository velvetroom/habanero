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
        self.addSubview(viewBar)
        self.addSubview(viewProgress)
        
        NSLayoutConstraint.bottomToBottom(
            view:viewBar,
            toView:self,
            constant:ViewCookStep.Constants.barBottom)
        NSLayoutConstraint.height(
            view:viewBar,
            constant:ViewCookStep.Constants.barHeight)
        NSLayoutConstraint.equalsHorizontal(
            view:viewBar,
            toView:self)
        
        NSLayoutConstraint.topToTop(
            view:viewList,
            toView:self)
        NSLayoutConstraint.bottomToTop(
            view:viewList,
            toView:viewBar)
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
