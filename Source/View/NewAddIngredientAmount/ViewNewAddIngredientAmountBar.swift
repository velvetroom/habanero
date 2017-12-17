import UIKit

final class ViewNewAddIngredientAmountBar:ViewBarBack<ArchNewAddIngredientAmount>
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
            UIColor.colourBackgroundDark,
            for:UIControlState.highlighted)
        buttonAdd.setTitle(
            String.localizedView(key:"ViewNewAddIngredientAmountBar_buttonAdd"),
            for:UIControlState())
        buttonAdd.titleLabel!.font = UIFont.bold(size:ViewGlobal.Constants.barTitleFontSize)
        buttonAdd.addTarget(
            self,
            action:#selector(self.selectorButtonAdd(sender:)),
            for:UIControlEvents.touchUpInside)
        
        self.labelTitle.text = self.controller.model.ingredient?.name.capitalized
        
        self.addSubview(buttonAdd)
        
        NSLayoutConstraint.topToTop(
            view:buttonAdd,
            toView:self,
            constant:ViewGlobal.Constants.contentTop)
        NSLayoutConstraint.bottomToBottom(
            view:buttonAdd,
            toView:self)
        NSLayoutConstraint.rightToRight(
            view:buttonAdd,
            toView:self)
        NSLayoutConstraint.width(
            view:buttonAdd,
            constant:ViewNewAddIngredientAmountBar.Constants.buttonAddWidth)
    }
    
    override func selectorButtonBack(sender button:UIButton)
    {
        self.controller.transitionBack()
    }
    
    //MARK: selectors
    
    @objc
    private func selectorButtonAdd(sender button:UIButton)
    {
        self.controller.createIngredient()
    }
}
