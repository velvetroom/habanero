import UIKit

final class ViewNew:ViewMain<ArchNew>
{
    private(set) weak var viewList:ViewNewList!
    
    override func factoryViews()
    {
        super.factoryViews()
        
        self.backgroundColor = UIColor.colourBackgroundGray
        
        let viewBar:ViewNewBar = ViewNewBar(controller:controller)
        
        let viewList:ViewNewList = ViewNewList(controller:controller)
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
