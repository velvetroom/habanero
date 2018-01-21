import UIKit

final class ViewFavourites:ViewMain<ArchFavourites>
{
    override func factoryViews()
    {
        super.factoryViews()
        
        let viewBar:ViewFavouritesBar = ViewFavouritesBar(controller:self.controller)
        
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
