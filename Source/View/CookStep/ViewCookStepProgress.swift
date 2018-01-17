import UIKit

final class ViewCookStepProgress:View<ArchCookStep>
{
    private(set) weak var layoutBarForegroundWidth:NSLayoutConstraint!
    
    override func factoryViews()
    {
        super.factoryViews()
        self.isUserInteractionEnabled = false
        
        let barBackground:ViewBorder = ViewBorder(colour:UIColor.colourHabaneroDark)
        
        let barForeground:ViewBorder = ViewBorder(colour:UIColor.colourHabanero)
        
        self.addSubview(barBackground)
        self.addSubview(barForeground)
        
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
    }
}
