import UIKit

final class ViewParent:UIView
{
    typealias Router = (
        (ViewParent) ->
        (CGPoint, CGFloat) -> ())
    
    weak var panRecognizer:UIPanGestureRecognizer!
    private(set) weak var controller:ControllerParent!
    private(set) weak var viewMenu:ViewMenu!
    var panningX:CGFloat?
    
    init(controller:ControllerParent)
    {
        super.init(frame:CGRect.zero)
        clipsToBounds = true
        backgroundColor = UIColor.white
        self.controller = controller
        
        let viewMenu:ViewMenu = ViewMenu(controller:controller)
        self.viewMenu = viewMenu
        
        addSubview(viewMenu)
        
        NSLayoutConstraint.bottomToBottom(
            view:viewMenu,
            toView:self)
        NSLayoutConstraint.height(
            view:viewMenu,
            constant:ViewMain.Constants.menuHeight)
        NSLayoutConstraint.equalsHorizontal(
            view:viewMenu,
            toView:self)
        
        factoryGesture()
    }
    
    required init?(coder:NSCoder)
    {
        return nil
    }
}
