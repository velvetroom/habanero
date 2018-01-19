import UIKit

final class ViewCookStepListCellText:ViewCookStepListCell
{
    override func factoryViews()
    {
        super.factoryViews()
        
        self.labelText.font = UIFont.regular(size:ViewCookStepListCellText.Constants.fontSize)
        
        NSLayoutConstraint.topToTop(
            view:self.labelText,
            toView:self)
        NSLayoutConstraint.bottomToBottom(
            view:self.labelText,
            toView:self)
    }
    
    override func config(
        controller:ControllerCookStep,
        item:CookStepItemProtocol)
    {
        super.config(
            controller:controller,
            item:item)
        
        guard
        
            let item:CookStepItemText = item as? CookStepItemText
        
        else
        {
            return
        }
        
        self.labelText.text = item.text
    }
}
