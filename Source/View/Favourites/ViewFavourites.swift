import UIKit

final class ViewFavourites:ViewMain<ArchFavourites>
{
    private weak var viewSpinner:ViewSpinner!
    
    override func factoryViews()
    {
        super.factoryViews()
        
        let viewBar:ViewFavouritesBar = ViewFavouritesBar(controller:self.controller)
        
        let viewSpinner:ViewSpinner = ViewSpinner()
        self.viewSpinner = viewSpinner
        
        self.addSubview(viewBar)
        self.addSubview(viewSpinner)
        
        NSLayoutConstraint.topToTop(
            view:viewBar,
            toView:self)
        NSLayoutConstraint.height(
            view:viewBar,
            constant:ViewGlobal.Constants.barHeight)
        NSLayoutConstraint.equalsHorizontal(
            view:viewBar,
            toView:self)
        
        NSLayoutConstraint.equals(
            view:viewSpinner,
            toView:self)
    }
}
