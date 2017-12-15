import UIKit

final class ViewNewAddIngredientAmount:ViewMain<ArchNewAddIngredientAmount>
{
    private(set) weak var viewInput:ViewNewAddIngredientAmountInput!
    
    override func factoryViews()
    {
        super.factoryViews()
        
        let viewInput:ViewNewAddIngredientAmountInput = ViewNewAddIngredientAmountInput(controller:self.controller)
        self.viewInput = viewInput
        
        addSubview(viewInput)
    }
}
