import UIKit

final class ViewNewAddIngredient:ViewMain<ArchNewAddIngredient>
{
    private(set) weak var viewBar:ViewNewAddIngredientBar!
    private(set) weak var viewList:ViewNewAddIngredientList!
    private(set) weak var viewSpinner:ViewSpinner!

    deinit
    {
        self.viewSpinner.stopAnimating()
    }
    
    override func factoryViews()
    {
        super.factoryViews()
        
        self.shouldPanBack = true
        self.backgroundColor = UIColor.colourBackgroundGray
        
        let viewSpinner:ViewSpinner = ViewSpinner()
        self.viewSpinner = viewSpinner
        
        let viewBar:ViewNewAddIngredientBar = ViewNewAddIngredientBar(controller:self.controller)
        self.viewBar = viewBar
        
        let viewList:ViewNewAddIngredientList = ViewNewAddIngredientList(controller:self.controller)
        self.viewList = viewList
        
        self.addSubview(viewSpinner)
        self.addSubview(viewList)
        self.addSubview(viewBar)
        
        NSLayoutConstraint.equals(
            view:viewSpinner,
            toView:self)
        
        NSLayoutConstraint.equals(
            view:viewList,
            toView:self)
        
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
