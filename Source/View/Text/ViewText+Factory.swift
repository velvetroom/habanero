import UIKit

extension ViewText
{
    //MARK: internal
    
    func factoryViews()
    {
        let viewInput:ViewTextInput = ViewTextInput()
        viewInput.text = self.controller.model.text
        self.viewInput = viewInput
        
        let viewBar:ViewTextBar = ViewTextBar(controller:self.controller)
        
        self.addSubview(viewInput)
        self.addSubview(viewBar)
        
        NSLayoutConstraint.topToTop(
            view:viewInput,
            toView:self)
        NSLayoutConstraint.bottomToTop(
            view:viewInput,
            toView:viewBar)
        NSLayoutConstraint.equalsHorizontal(
            view:viewInput,
            toView:self)
        
        layoutBarBottom = NSLayoutConstraint.bottomToBottom(
            view:viewBar,
            toView:self)
        NSLayoutConstraint.height(
            view:viewBar,
            constant:ViewText.Constants.barHeight)
        NSLayoutConstraint.equalsHorizontal(
            view:viewBar,
            toView:self)
    }
}
