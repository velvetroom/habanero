import UIKit

final class ViewNewAddListFooterIngredients:ViewNewAddListFooter
{
    override func factoryViews()
    {
        super.factoryViews()
        
        let buttonAdd:UIButton = UIButton()
        buttonAdd.translatesAutoresizingMaskIntoConstraints = false
        buttonAdd.setTitleColor(
            UIColor.colourSuccess,
            for:UIControlState.normal)
        buttonAdd.setTitleColor(
            UIColor(white:0, alpha:0.2),
            for:UIControlState.highlighted)
        buttonAdd.setTitle(
            String.localizedView(key:"ViewNewAddListFooterIngredients_buttonAdd"),
            for:UIControlState())
        buttonAdd.titleLabel!.font = UIFont.medium(
            size:ViewNewAddListFooterIngredients.Constants.buttonFontSize)
        self.addSubview(buttonAdd)
        
        NSLayoutConstraint.equalsVertical(
            view:buttonAdd,
            toView:self)
        NSLayoutConstraint.width(
            view:buttonAdd,
            constant:ViewNewAddListFooterIngredients.Constants.buttonWidth)
        NSLayoutConstraint.leftToLeft(
            view:buttonAdd,
            toView:self)
    }
    
    //MARK: selectors
    
    @objc
    private func selectorButtonDelete(sender button:UIButton)
    {
        self.controller?.alertConfirmDelete()
    }
}
