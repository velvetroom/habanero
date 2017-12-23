import UIKit

final class ViewPhotoCrop:ViewMain<ArchPhotoCrop>
{
    override func factoryViews()
    {
        super.factoryViews()
        self.backgroundColor = UIColor.black
        
        let viewMenu:ViewPhotoCropMenu = ViewPhotoCropMenu(controller:self.controller)
        
        self.addSubview(viewMenu)
        
        NSLayoutConstraint.bottomToBottom(
            view:viewMenu,
            toView:self)
        NSLayoutConstraint.height(
            view:viewMenu,
            constant:ViewPhotoCrop.Constants.menuHeight)
        NSLayoutConstraint.equalsHorizontal(
            view:viewMenu,
            toView:self)
    }
}