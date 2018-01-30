import UIKit

final class ViewOptions:ViewMain<ArchOptions>
{
    override func factoryViews()
    {
        super.factoryViews()
        self.backgroundColor = UIColor.colourBackgroundGray
        
        let viewBar:ViewOptionsBar = ViewOptionsBar(controller:self.controller)
        
        let viewList:ViewOptionsList = ViewOptionsList(controller:self.controller)
        
        self.addSubview(viewBar)
        self.addSubview(viewList)
        
        NSLayoutConstraint.topToTop(
            view:viewBar,
            toView:self)
        NSLayoutConstraint.height(
            view:viewBar,
            constant:ViewGlobal.Constants.barHeight)
        NSLayoutConstraint.equalsHorizontal(
            view:viewBar,
            toView:self)
        
        NSLayoutConstraint.topToBottom(
            view:viewList,
            toView:viewBar)
        NSLayoutConstraint.bottomToBottom(
            view:viewList,
            toView:self)
        NSLayoutConstraint.equalsHorizontal(
            view:viewList,
            toView:self)
    }
}
