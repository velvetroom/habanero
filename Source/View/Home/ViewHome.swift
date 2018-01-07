import UIKit

final class ViewHome:ViewMain<ArchHome>
{
    private weak var viewSpinner:ViewSpinner!
    
    override func factoryViews()
    {
        super.factoryViews()
        
        let viewBar:ViewHomeBar = ViewHomeBar(controller:self.controller)
        
        let viewSpinner:ViewSpinner = ViewSpinner()
        self.viewSpinner = viewSpinner
        
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
            constant:ViewGlobal.Constants.barHeight)
        NSLayoutConstraint.equalsHorizontal(
            view:viewBar,
            toView:self)
    }
    
    deinit
    {
        self.viewSpinner.stopAnimating()
    }
}
