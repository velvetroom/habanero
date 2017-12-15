import UIKit

final class ViewNewAddIngredientAmount:ViewMain<ArchNewAddIngredientAmount>
{
    private(set) weak var viewInput:ViewNewAddIngredientAmountInput!
    
    override func factoryViews()
    {
        super.factoryViews()
        
        self.shouldPanBack = true
        self.backgroundColor = UIColor.colourBackgroundGray
        
        let viewBar:ViewNewAddIngredientAmountBar = ViewNewAddIngredientAmountBar(controller:self.controller)
        
        let viewInput:ViewNewAddIngredientAmountInput = ViewNewAddIngredientAmountInput(controller:self.controller)
        self.viewInput = viewInput
        
        self.addSubview(viewInput)
        self.addSubview(viewBar)
        
        NSLayoutConstraint.topToTop(
            view:viewBar,
            toView:self)
        NSLayoutConstraint.height(
            view:viewBar,
            constant:ViewGlobal.Constants.barHeight)
        NSLayoutConstraint.equalsHorizontal(
            view:viewBar,
            toView:self)
    }
}
