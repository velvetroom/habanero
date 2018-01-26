import UIKit

final class ViewCookFavourite:UIButton
{
    private(set) weak var labelAmount:UILabel!
    private weak var layoutAmountLeft:NSLayoutConstraint?
    
    init()
    {
        super.init(frame:CGRect.zero)
        self.clipsToBounds = true
        self.translatesAutoresizingMaskIntoConstraints = false
        self.setImage(
            #imageLiteral(resourceName: "assetGenericFavouriteOff"),
            for:UIControlState.normal)
        self.setImage(
            #imageLiteral(resourceName: "assetGenericFavouriteOn"),
            for:UIControlState.highlighted)
        self.setImage(
            #imageLiteral(resourceName: "assetGenericFavouriteOn"),
            for:UIControlState.selected)
        self.imageView!.clipsToBounds = true
        self.imageView!.contentMode = UIViewContentMode.center
        
        let labelAmount:UILabel = UILabel()
        labelAmount.translatesAutoresizingMaskIntoConstraints = false
        labelAmount.isUserInteractionEnabled = false
        labelAmount.backgroundColor = UIColor.clear
        labelAmount.font = UIFont.medium(size:ViewCookFavourite.Constants.fontSize)
        labelAmount.textColor = UIColor.colourBackgroundDark
        labelAmount.textAlignment = NSTextAlignment.center
        self.labelAmount = labelAmount
        
        self.addSubview(labelAmount)
        
        NSLayoutConstraint.equalsVertical(
            view:labelAmount,
            toView:self)
        NSLayoutConstraint.rightToRight(
            view:labelAmount,
            toView:self)
        self.layoutAmountLeft = NSLayoutConstraint.leftToLeft(
            view:labelAmount,
            toView:self)
    }
    
    required init?(coder:NSCoder)
    {
        return nil
    }
    
    override func layoutSubviews()
    {
        let width:CGFloat = self.bounds.width
        let width_2:CGFloat = width / 2.0
        self.layoutAmountLeft?.constant = width_2
        
        super.layoutSubviews()
    }
}
