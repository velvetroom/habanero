import UIKit

final class ViewHomeListCell:ViewCollectionCell
{
    private(set) weak var model:CookItem?
    private(set) weak var imageView:UIImageView!
    private(set) weak var viewFavourite:ViewCookFavourite!
    private weak var controller:ControllerHome?
    private weak var labelTitle:UILabel!
    
    private var transformScale:CGAffineTransform
    {
        get
        {
            let transform:CGAffineTransform = CGAffineTransform(
                scaleX:ViewHomeListCell.Constants.animateScale,
                y:ViewHomeListCell.Constants.animateScale)
            
            return transform
        }
    }
    
    private var transformOriginal:CGAffineTransform
    {
        get
        {
            let transform:CGAffineTransform = CGAffineTransform(
                scaleX:1,
                y:1)
            
            return transform
        }
    }
    
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
        
        let viewFavourite:ViewCookFavourite = ViewCookFavourite()
        viewFavourite.addTarget(
            self,
            action:#selector(self.selectorFavourite(sender:)),
            for:UIControlEvents.touchUpInside)
        self.viewFavourite = viewFavourite
        
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
        self.addSubview(viewFavourite)
        
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
        NSLayoutConstraint.leftToLeft(
            view:labelTitle,
            toView:viewBlur,
            constant:ViewHomeList.Constants.padding)
        NSLayoutConstraint.rightToLeft(
            view:labelTitle,
            toView:viewFavourite)
        
        NSLayoutConstraint.equalsVertical(
            view:viewFavourite,
            toView:viewBlur)
        NSLayoutConstraint.rightToRight(
            view:viewFavourite,
            toView:viewBlur)
        NSLayoutConstraint.width(
            view:viewFavourite,
            constant:ViewHomeListCell.Constants.favouriteWidth)
    }
    
    override func showHighlighted()
    {
        super.showHighlighted()
        
        let transform:CGAffineTransform = self.transformScale
        
        UIView.animate(withDuration:ViewGlobal.Constants.animationDuration)
        { [weak self] in
            
            self?.transform = transform
        }
    }
    
    override func showReleased()
    {
        super.showReleased()
        self.transform = self.transformOriginal
    }
    
    //MARK: selectors
    
    @objc
    private func selectorFavourite(sender button:UIButton)
    {
        guard
        
            let model:CookItem = self.model
        
        else
        {
            return
        }
        
        self.controller?.favouriteItem(cookItem:model)
        { [weak self] in
            
            self?.updateFavourite(model:model)
        }
    }
    
    //MARK: private
    
    private func updateFavourite(model:CookItem)
    {
        self.model?.favourite.configureView(
            model,
            self.viewFavourite)
    }
    
    //MARK: internal
    
    func config(
        controller:ControllerHome,
        model:CookItem)
    {
        self.controller = controller
        self.model = model
        self.labelTitle.text = model.recipe.title
        
        self.showState()
        self.updateFavourite(model:model)
    }
}
