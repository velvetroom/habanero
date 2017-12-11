import UIKit

final class ViewNewAdd:ViewMain<ArchNewAdd>
{
    private(set) weak var viewList:ViewNewAddList!
    
    override func factoryViews()
    {
        super.factoryViews()
        
        let viewBar:ViewNewAddBar = ViewNewAddBar(controller:controller)
        
        let viewList:ViewNewAddList = ViewNewAddList(controller:controller)
        self.viewList = viewList
        
        self.addSubview(viewList)
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
        
        NSLayoutConstraint.equals(
            view:viewList,
            toView:self)
    }
}
