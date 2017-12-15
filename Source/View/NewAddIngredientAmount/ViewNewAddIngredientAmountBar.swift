import UIKit

final class ViewNewAddIngredientAmountBar:ViewBarBack<ArchNewAddIngredientAmount>
{
    override func factoryViews()
    {
        super.factoryViews()
        
        self.labelTitle.text = self.controller.model.ingredient?.name
    }
    
    override func selectorButtonBack(sender button:UIButton)
    {
        self.controller.transitionBack()
    }
}
