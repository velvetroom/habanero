import UIKit

final class ViewPhotoCrop:ViewMain<ArchPhotoCrop>
{
    private(set) weak var viewDisplay:ViewPhotoCropDisplay!
    
    override func factoryViews()
    {
        super.factoryViews()
        self.backgroundColor = UIColor.black
        
        let viewMenu:ViewPhotoCropMenu = ViewPhotoCropMenu(controller:self.controller)
        
        let viewDisplay:ViewPhotoCropDisplay = ViewPhotoCropDisplay(controller:self.controller)
        self.viewDisplay = viewDisplay
        
        self.addSubview(viewMenu)
        self.addSubview(viewDisplay)
        
        NSLayoutConstraint.bottomToBottom(
            view:viewMenu,
            toView:self)
        NSLayoutConstraint.height(
            view:viewMenu,
            constant:ViewPhotoCrop.Constants.menuHeight)
        NSLayoutConstraint.equalsHorizontal(
            view:viewMenu,
            toView:self)
        
        NSLayoutConstraint.topToTop(
            view:viewDisplay,
            toView:self)
        NSLayoutConstraint.equalsHorizontal(
            view:viewDisplay,
            toView:self)
        NSLayoutConstraint.bottomToTop(
            view:viewDisplay,
            toView:viewMenu)
    }
}
