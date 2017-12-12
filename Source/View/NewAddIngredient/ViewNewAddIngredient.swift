import UIKit

final class ViewNewAddIngredient:ViewMain<ArchNewAddIngredient>
{
    private(set) weak var viewBar:ViewNewAddIngredientBar!
    weak var viewSpinner:ViewSpinner?
    
    override var shouldPanBack:Bool
    {
        get
        {
            return true
        }
    }
    
    deinit
    {
        self.viewSpinner?.stopAnimating()
    }
    
    override func factoryViews()
    {
        super.factoryViews()
        
        self.backgroundColor = UIColor.colourBackgroundGray
        
        let viewSpinner:ViewSpinner = ViewSpinner()
        self.viewSpinner = viewSpinner
        
        let viewBar:ViewNewAddIngredientBar = ViewNewAddIngredientBar(controller:self.controller)
        self.viewBar = viewBar
        
        self.addSubview(viewSpinner)
        self.addSubview(viewBar)
        
        NSLayoutConstraint.equals(
            view:viewSpinner,
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
