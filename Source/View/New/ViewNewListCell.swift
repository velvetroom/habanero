import UIKit

final class ViewNewListCell:ViewCollectionCell
{
    let attributesTitle:[NSAttributedStringKey:Any]
    let attributesDuration:[NSAttributedStringKey:Any]
    private(set) weak var viewSteps:ViewNewListCellSteps!
    private(set) weak var labelInfo:UILabel!
    private(set) weak var imageView:UIImageView!
    
    override init(frame:CGRect)
    {
        self.attributesTitle = [
            NSAttributedStringKey.font:UIFont.regular(size:ViewNewListCell.Constants.titleFontSize),
            NSAttributedStringKey.foregroundColor:UIColor.colourBackgroundDark]
        
        self.attributesDuration = [
            NSAttributedStringKey.font:UIFont.regular(size:ViewNewListCell.Constants.durationFontSize),
            NSAttributedStringKey.foregroundColor:UIColor(white:0, alpha:0.5)]
        
        super.init(frame:frame)
    }
    
    required init?(coder:NSCoder)
    {
        return nil
    }
    
    override func factoryViews()
    {
        super.factoryViews()
        
        let labelInfo:UILabel = UILabel()
        labelInfo.isUserInteractionEnabled = false
        labelInfo.translatesAutoresizingMaskIntoConstraints = false
        labelInfo.backgroundColor = UIColor.clear
        labelInfo.numberOfLines = 0
        self.labelInfo = labelInfo
        
        let viewSteps:ViewNewListCellSteps = ViewNewListCellSteps()
        self.viewSteps = viewSteps
        
        let imageView:UIImageView = UIImageView()
        imageView.isUserInteractionEnabled = false
        imageView.clipsToBounds = true
        imageView.contentMode = UIViewContentMode.scaleAspectFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.backgroundColor = UIColor.colourBackgroundGray
        imageView.layer.borderWidth = ViewGlobal.Constants.borderWidth
        imageView.layer.borderColor = UIColor.colourBackgroundDark.cgColor
        self.imageView = imageView
        
        addSubview(labelInfo)
        addSubview(viewSteps)
        addSubview(imageView)
        
        NSLayoutConstraint.topToTop(
            view:labelInfo,
            toView:self,
            constant:ViewNewListCell.Constants.infoTop)
        NSLayoutConstraint.heightGreaterOrEqual(
            view:labelInfo)
        NSLayoutConstraint.leftToRight(
            view:labelInfo,
            toView:imageView,
            constant:ViewNewListCell.Constants.infoLeft)
        NSLayoutConstraint.rightToLeft(
            view:labelInfo,
            toView:viewSteps)
        
        NSLayoutConstraint.equalsVertical(
            view:viewSteps,
            toView:self)
        NSLayoutConstraint.width(
            view:viewSteps,
            constant:ViewNewListCell.Constants.stepsWidth)
        NSLayoutConstraint.rightToRight(
            view:viewSteps,
            toView:self)
        
        NSLayoutConstraint.equalsVertical(
            view:imageView,
            toView:self,
            margin:ViewNewListCell.Constants.imageMarginVertical)
        NSLayoutConstraint.leftToLeft(
            view:imageView,
            toView:self,
            constant:ViewNewListCell.Constants.imageLeft)
        NSLayoutConstraint(
            item:imageView,
            attribute:NSLayoutAttribute.width,
            relatedBy:NSLayoutRelation.equal,
            toItem:imageView,
            attribute:NSLayoutAttribute.height,
            multiplier:1,
            constant:0).isActive = true
    }
    
    override func showReleased()
    {
        super.showReleased()
        
        self.backgroundColor = UIColor.white
    }
    
    override func showHighlighted()
    {
        super.showHighlighted()
        
        self.backgroundColor = UIColor.colourSuccess.withAlphaComponent(0.4)
    }
}
