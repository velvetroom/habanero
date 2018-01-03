import UIKit

final class ViewNewAdd:ViewMain<ArchNewAdd>
{
    private(set) weak var viewList:ViewNewAddList!
    private(set) weak var viewBar:ViewNewAddBar!
    private(set) weak var viewSpinner:ViewSpinner!
    
    override func factoryViews()
    {
        super.factoryViews()
        
        self.backgroundColor = UIColor.colourBackgroundGray
        
        let viewSpinner:ViewSpinner = ViewSpinner()
        viewSpinner.stopAnimating()
        self.viewSpinner = viewSpinner
        
        let viewBar:ViewNewAddBar = ViewNewAddBar(controller:controller)
        self.viewBar = viewBar
        
        let viewList:ViewNewAddList = ViewNewAddList(controller:controller)
        self.viewList = viewList
        
        self.addSubview(viewList)
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
            view:viewList,
            toView:self)
        
        NSLayoutConstraint.equals(
            view:viewSpinner,
            toView:self)
    }
    
    deinit
    {
        self.viewSpinner.stopAnimating()
    }
}
