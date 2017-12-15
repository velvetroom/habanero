import UIKit

final class ViewNewAddIngredientAmount:ViewMain<ArchNewAddIngredientAmount>
{
    private(set) weak var viewInput:ViewNewAddIngredientAmountInput!
    
    override func factoryViews()
    {
        super.factoryViews()
        
        self.shouldPanBack = true
        self.backgroundColor = UIColor.colourBackgroundGray
        
        let viewInput:ViewNewAddIngredientAmountInput = ViewNewAddIngredientAmountInput(controller:self.controller)
        self.viewInput = viewInput
        
        self.addSubview(viewInput)
    }
}
