import UIKit

final class ViewCookFavourite:UIButton
{
    private weak var labelAmount:UILabel!
    
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
        
        self.labelAmount = labelAmount
        
        self.addSubview(labelAmount)
    }
    
    required init?(coder:NSCoder)
    {
        return nil
    }
}
