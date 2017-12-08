import UIKit

extension ViewText
{
    //MARK: internal
    
    func factoryViews()
    {
        let viewInput:ViewTextInput = ViewTextInput()
        viewInput.text = self.controller.model.text
        self.viewInput = viewInput
        
        self.addSubview(viewInput)
        
        NSLayoutConstraint.topToTop(
            view:viewInput,
            toView:self)
        layoutInputBottom = NSLayoutConstraint.bottomToBottom(
            view:viewInput,
            toView:self)
        NSLayoutConstraint.equalsHorizontal(
            view:viewInput,
            toView:self)
    }
}
