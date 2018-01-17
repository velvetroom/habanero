import UIKit

final class ViewCookStepListCellImage:ViewCookStepListCell
{
    private(set) weak var item:CookStepItemImage?
    private(set) weak var imageView:UIImageView!
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
        
        self.addSubview(imageView)
        
        NSLayoutConstraint.topToTop(
            view:imageView,
            toView:self)
        layoutImageHeight = NSLayoutConstraint.height(
            view:imageView)
        NSLayoutConstraint.equalsHorizontal(
            view:imageView,
            toView:self,
            margin:ViewCookStepListCell.Constants.margin)
        
        NSLayoutConstraint.topToBottom(
            view:self.labelText,
            toView:imageView,
            constant:ViewCookStepListCell.Constants.margin)
        NSLayoutConstraint.heightGreaterOrEqual(
            view:self.labelText)
    }
    
    override func layoutSubviews()
    {
        let width:CGFloat = self.bounds.width
        let margin2:CGFloat = ViewCookStepListCell.Constants.margin * 2
        layoutImageHeight.constant = width - margin2
        
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
        
        self.item = item
        self.labelText.text = item.text
        
        self.updateImage(
            controller:controller,
            item:item)
    }
    
    //MARK: private
    
    private func updateImage(
        controller:ControllerCookStep,
        item:CookStepItemImage)
    {
        guard
        
            let image:UIImage = item.image
        
        else
        {
            self.imageView.image = nil
            
            controller.loadStepImage(
                item:item,
                cell:self)
            
            return
        }
        
        self.imageView.image = image
    }
}
