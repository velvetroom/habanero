import UIKit

final class ViewCookFavourite:UIButton
{
    private weak var labelAmount:UILabel!
    private weak var layoutAmountLeft:NSLayoutConstraint!
    
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
        self.labelAmount = labelAmount
        
        self.addSubview(labelAmount)
        
        NSLayoutConstraint.equalsVertical(
            view:labelAmount,
            toView:self)
        NSLayoutConstraint.rightToRight(
            view:labelAmount,
            toView:self)
        layoutAmountLeft = NSLayoutConstraint.leftToLeft(
            view:labelAmount,
            toView:self)
    }
    
    required init?(coder:NSCoder)
    {
        return nil
    }
}
