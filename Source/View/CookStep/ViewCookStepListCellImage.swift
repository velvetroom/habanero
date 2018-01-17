import UIKit

final class ViewCookStepListCellImage:ViewCookStepListCell
{
    private weak var imageView:UIImageView!
    private weak var layoutImageHeight:NSLayoutConstraint!
    
    override func factoryViews()
    {
        super.factoryViews()
        
        let imageView:UIImageView = UIImageView()
        imageView.isUserInteractionEnabled = false
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = UIViewContentMode.center
        imageView.clipsToBounds = true
        self.imageView = imageView
        
        NSLayoutConstraint.topToTop(
            view:imageView,
            toView:self)
        layoutImageHeight = NSLayoutConstraint.height(
            view:imageView)
        NSLayoutConstraint.equalsHorizontal(
            view:imageView,
            toView:self,
            margin:ViewCookStepListCell.Constants.marginHorizontal)
        
        NSLayoutConstraint.topToBottom(
            view:self.labelText,
            toView:imageView)
    }
    
    override func layoutSubviews()
    {
        let width:CGFloat = self.bounds.width
        layoutImageHeight.constant = width
        
        super.layoutSubviews()
    }
    
    override func config(
        controller:ControllerCookStep,
        item:CookStepItemProtocol)
    {
        super.config(
            controller:controller,
            item:item)
        
        guard
            
            let item:CookStepItemImage = item as? CookStepItemImage
            
        else
        {
            return
        }
        
        self.labelText.text = item.text
    }
}
