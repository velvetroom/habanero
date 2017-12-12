import UIKit

final class ViewNewAddIngredient:ViewMain<ArchNewAddIngredient>
{
    private(set) weak var viewBar:ViewNewAddIngredientBar!
    
    override func factoryViews()
    {
        super.factoryViews()
        
        let viewBar:ViewNewAddIngredientBar = ViewNewAddIngredientBar(controller:self.controller)
        self.viewBar = viewBar
        
        self.addSubview(viewBar)
        
        NSLayoutConstraint.topToTop(
            view:viewBar,
            toView:self)
        NSLayoutConstraint.height(
            view:viewBar,
            constant:ViewNewAddIngredient.Constants.barHeight)
        NSLayoutConstraint.equalsHorizontal(
            view:viewBar,
            toView:self)
    }
}
