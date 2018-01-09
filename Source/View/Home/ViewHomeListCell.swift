import UIKit

final class ViewHomeListCell:ViewCollectionCell
{
    private(set) weak var model:HomeItem?
    
    override func factoryViews()
    {
        super.factoryViews()
        self.clipsToBounds = false
        
        let baseView:UIView = UIView()
        baseView.isUserInteractionEnabled = false
        baseView.backgroundColor = UIColor.white
        baseView.translatesAutoresizingMaskIntoConstraints = false
        baseView.layer.cornerRadius = ViewHomeListCell.Constants.cornerRadius
        baseView.layer.shadowColor = UIColor.black.cgColor
        baseView.layer.shadowOpacity = 0.1
        baseView.layer.shadowRadius = 10
        baseView.layer.shadowOffset = CGSize.zero
        
        let containerView:UIView = UIView()
        containerView.isUserInteractionEnabled = false
        containerView.translatesAutoresizingMaskIntoConstraints = false
        containerView.clipsToBounds = true
        
        self.addSubview(baseView)
        self.addSubview(containerView)
        
        NSLayoutConstraint.equalsVertical(
            view:baseView,
            toView:self)
        NSLayoutConstraint.equalsHorizontal(
            view:baseView,
            toView:self,
            margin:ViewHomeList.Constants.padding)
        
        NSLayoutConstraint.equals(
            view:containerView,
            toView:baseView)
    }
}
