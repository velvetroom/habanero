import UIKit

final class ViewHomeFilter:View<ArchHome>
{
    override func factoryViews()
    {
        super.factoryViews()
        self.backgroundColor = UIColor.white
        
        let viewBorder:ViewBorder = ViewBorder(colour:UIColor(white:0, alpha:0.2))
        
        let viewList:ViewHomeFilterList = ViewHomeFilterList(controller:self.controller)
        
        self.addSubview(viewBorder)
        self.addSubview(viewList)
        
        NSLayoutConstraint.height(
            view:viewBorder,
            constant:ViewGlobal.Constants.borderWidth)
        NSLayoutConstraint.bottomToBottom(
            view:viewBorder,
            toView:self)
        NSLayoutConstraint.equalsHorizontal(
            view:viewBorder,
            toView:self)
        
        NSLayoutConstraint.equals(
            view:viewList,
            toView:self)
    }
}
