import UIKit

final class ViewHome:ViewMain<ArchHome>
{
    private(set) weak var viewBar:ViewHomeBar!
    private(set) weak var viewSpinner:ViewSpinner!
    private(set) weak var viewList:ViewHomeList!
    
    override func factoryViews()
    {
        super.factoryViews()
        self.backgroundColor = UIColor.colourBackgroundGray
        
        let viewBar:ViewHomeBar = ViewHomeBar(controller:self.controller)
        self.viewBar = viewBar
        
        let viewSpinner:ViewSpinner = ViewSpinner()
        self.viewSpinner = viewSpinner
        
        let viewList:ViewHomeList = ViewHomeList(controller:self.controller)
        viewList.isHidden = true
        self.viewList = viewList
        
        self.addSubview(viewList)
        self.addSubview(viewSpinner)
        self.addSubview(viewBar)
        
        NSLayoutConstraint.equals(
            view:viewSpinner,
            toView:self)
        
        NSLayoutConstraint.topToBottom(
            view:viewList,
            toView:viewBar)
        NSLayoutConstraint.bottomToBottom(
            view:viewList,
            toView:self,
            constant:-ViewGlobal.Constants.menuHeight)
        NSLayoutConstraint.equalsHorizontal(
            view:viewList,
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
