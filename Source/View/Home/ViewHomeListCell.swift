import UIKit

final class ViewHomeListCell:ViewCollectionCell
{
    private(set) weak var model:HomeItem?
    private(set) weak var imageView:UIImageView!
    
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
        baseView.layer.shadowOpacity = ViewHomeListCell.Constants.shadowOpacity
        baseView.layer.shadowRadius = ViewHomeListCell.Constants.shadowRadius
        baseView.layer.shadowOffset = CGSize.zero
        
        let containerView:UIView = UIView()
        containerView.isUserInteractionEnabled = false
        containerView.translatesAutoresizingMaskIntoConstraints = false
        containerView.clipsToBounds = true
        containerView.layer.cornerRadius = ViewHomeListCell.Constants.cornerRadius
        
        let imageView:UIImageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.clipsToBounds = true
        imageView.contentMode = UIViewContentMode.scaleAspectFit
        imageView.isUserInteractionEnabled = false
        self.imageView = imageView
        
        let viewBlur:ViewBlur = ViewBlur.extraLight()
        
        containerView.addSubview(imageView)
        containerView.addSubview(viewBlur)
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
        
        NSLayoutConstraint.equals(
            view:imageView,
            toView:containerView)
        
        NSLayoutConstraint.height(
            view:viewBlur,
            constant:ViewHomeListCell.Constants.blurHeight)
        NSLayoutConstraint.bottomToBottom(
            view:viewBlur,
            toView:containerView)
        NSLayoutConstraint.equalsHorizontal(
            view:viewBlur,
            toView:containerView)
    }
    
    //MARK: internal
    
    func config(model:HomeItem)
    {
        self.model = model
    }
}
