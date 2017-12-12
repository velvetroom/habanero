import UIKit

final class ViewNewAddIngredientListFooter:ViewCollectionReusable
{
    private weak var controller:ControllerNewAddIngredient?
    private weak var layoutButtonLeft:NSLayoutConstraint!
    
    override func layoutSubviews()
    {
        let width:CGFloat = self.bounds.width
        let remainWidth:CGFloat = width - ViewNewAddIngredientListFooter.Constants.buttonWidth
        let marginLeft:CGFloat = remainWidth / 2.0
        self.layoutButtonLeft.constant = marginLeft
        
        super.layoutSubviews()
    }
    
    override func factoryViews()
    {
        super.factoryViews()
        
        let button:UIButton = UIButton()
        button.backgroundColor = UIColor.colourHabanero
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle(
            String.localizedView(key:"ViewNewAddIngredientListFooter_buttonTitle"),
            for:UIControlState())
        button.setTitleColor(
            UIColor.colourBackgroundDark,
            for:UIControlState.normal)
        button.setTitleColor(
            UIColor(white:0, alpha:0.2),
            for:UIControlState.highlighted)
        button.titleLabel!.font = UIFont.medium(size:ViewNewAddIngredientListFooter.Constants.buttonFontSize)
        button.layer.cornerRadius = ViewNewAddIngredientListFooter.Constants.buttonCornerRadius
        button.addTarget(
            self,
            action:#selector(self.selectorButton(sender:)),
            for:UIControlEvents.touchUpInside)
        
        self.addSubview(button)
        
        NSLayoutConstraint.bottomToBottom(
            view:button,
            toView:self)
        NSLayoutConstraint.height(
            view:button,
            constant:ViewNewAddIngredientListFooter.Constants.buttonHeight)
        NSLayoutConstraint.width(
            view:button,
            constant:ViewNewAddIngredientListFooter.Constants.buttonWidth)
        self.layoutButtonLeft = NSLayoutConstraint.leftToLeft(
            view:button,
            toView:self)
    }
    
    //MARK: selectors
    
    @objc
    private func selectorButton(sender button:UIButton)
    {
        self.controller?.createIngredient()
    }
    
    //MARK: internal
    
    func config(controller:ControllerNewAddIngredient)
    {
        self.controller = controller
    }
}
