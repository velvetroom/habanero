import UIKit

final class ViewHomeListCell:ViewCollectionCell
{
    override func factoryViews()
    {
        super.factoryViews()
        
        let baseView:UIView = UIView()
        baseView.isUserInteractionEnabled = false
        baseView.backgroundColor = UIColor.white
        baseView.clipsToBounds = true
        baseView.translatesAutoresizingMaskIntoConstraints = false
        baseView.layer.cornerRadius = ViewHomeListCell.Constants.cornerRadius
        
        self.addSubview(baseView)
        
        NSLayoutConstraint.equalsVertical(
            view:baseView,
            toView:self)
        NSLayoutConstraint.equalsHorizontal(
            view:baseView,
            toView:self,
            margin:ViewHomeList.Constants.padding)
    }
}
