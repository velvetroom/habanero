import UIKit

final class ViewHome:ViewMain<ArchHome>
{
    private weak var viewSpinner:ViewSpinner!
    
    override func factoryViews()
    {
        super.factoryViews()
        
        let viewSpinner:ViewSpinner = ViewSpinner()
        self.viewSpinner = viewSpinner
        
        self.addSubview(viewSpinner)
        
        NSLayoutConstraint.equals(
            view:viewSpinner,
            toView:self)
    }
    
    deinit
    {
        self.viewSpinner.stopAnimating()
    }
}
