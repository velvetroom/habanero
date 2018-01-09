import UIKit

final class ViewHomeListCell:ViewCollectionCell
{
    private(set) weak var model:HomeItem?
    private(set) weak var imageView:UIImageView!
    private weak var labelTitle:UILabel!
    
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
        
        let labelTitle:UILabel = UILabel()
        labelTitle.backgroundColor = UIColor.clear
        labelTitle.isUserInteractionEnabled = false
        labelTitle.translatesAutoresizingMaskIntoConstraints = false
        labelTitle.numberOfLines = 0
        labelTitle.font = UIFont.bold(size:ViewHomeListCell.Constants.titleFontSize)
        labelTitle.textColor = UIColor.colourBackgroundDark
        self.labelTitle = labelTitle
        
        containerView.addSubview(imageView)
        containerView.addSubview(viewBlur)
        containerView.addSubview(labelTitle)
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
        
        NSLayoutConstraint.topToTop(
            view:viewBlur,
            toView:containerView)
        NSLayoutConstraint.height(
            view:viewBlur,
            constant:ViewHomeListCell.Constants.blurHeight)
        NSLayoutConstraint.equalsHorizontal(
            view:viewBlur,
            toView:containerView)
        
        NSLayoutConstraint.equalsVertical(
            view:labelTitle,
            toView:viewBlur)
        NSLayoutConstraint.equalsHorizontal(
            view:labelTitle,
            toView:viewBlur,
            margin:ViewHomeList.Constants.padding)
    }
    
    //MARK: internal
    
    func config(model:HomeItem)
    {
        self.model = model
        self.labelTitle.text = model.recipe.title
    }
}
