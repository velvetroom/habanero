import UIKit

final class ViewHomeFilter:View<ArchHome>
{
    override func factoryViews()
    {
        super.factoryViews()
        self.backgroundColor = UIColor(white:0, alpha:0.1)
        
        let viewBorder:ViewBorder = ViewBorder(colour:UIColor(white:0, alpha:0.2))
        
        self.addSubview(viewBorder)
        
        NSLayoutConstraint.height(
            view:viewBorder,
            constant:ViewGlobal.Constants.borderWidth)
        NSLayoutConstraint.bottomToBottom(
            view:viewBorder,
            toView:self)
        NSLayoutConstraint.equalsHorizontal(
            view:viewBorder,
            toView:self)
    }
}
