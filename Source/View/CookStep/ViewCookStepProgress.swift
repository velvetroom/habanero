import UIKit

final class ViewCookStepProgress:View<ArchCookStep>
{
    private(set) weak var viewIndicator:ViewCookStepProgressIndicator!
    private(set) weak var layoutBarForegroundWidth:NSLayoutConstraint!
    
    override func factoryViews()
    {
        super.factoryViews()
        self.isUserInteractionEnabled = false
        
        let indicatorSize_2:CGFloat = ViewCookStepProgress.Constants.indicatorSize / 2.0
        
        let barBackground:ViewBorder = ViewBorder(colour:UIColor.colourHabaneroDark)
        
        let barForeground:ViewBorder = ViewBorder(colour:UIColor.colourHabanero)
        
        let viewIndicator:ViewCookStepProgressIndicator = ViewCookStepProgressIndicator(controller:self.controller)
        self.viewIndicator = viewIndicator
        
        self.addSubview(barBackground)
        self.addSubview(barForeground)
        self.addSubview(viewIndicator)
        
        NSLayoutConstraint.bottomToBottom(
            view:barBackground,
            toView:self)
        NSLayoutConstraint.height(
            view:barBackground,
            constant:ViewCookStepProgress.Constants.barHeight)
        NSLayoutConstraint.equalsHorizontal(
            view:barBackground,
            toView:self)
        
        NSLayoutConstraint.bottomToBottom(
            view:barForeground,
            toView:self)
        NSLayoutConstraint.height(
            view:barForeground,
            constant:ViewCookStepProgress.Constants.barHeight)
        layoutBarForegroundWidth = NSLayoutConstraint.width(
            view:barForeground)
        
        NSLayoutConstraint.bottomToTop(
            view:viewIndicator,
            toView:barBackground)
        NSLayoutConstraint.leftToRight(
            view:viewIndicator,
            toView:barForeground,
            constant:indicatorSize_2)
        NSLayoutConstraint.size(
            view:viewIndicator,
            constant:ViewCookStepProgress.Constants.indicatorSize)
    }
}
