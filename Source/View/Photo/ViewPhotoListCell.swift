import UIKit

final class ViewPhotoListCell:ViewCollectionCell
{
    private weak var imageView:UIImageView!
    
    override func factoryViews()
    {
        super.factoryViews()
        
        let imageView:UIImageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.clipsToBounds = true
        imageView.contentMode = UIViewContentMode.center
        imageView.isUserInteractionEnabled = false
        self.imageView = imageView
        
        self.addSubview(imageView)
        
        NSLayoutConstraint.equals(
            view:imageView,
            toView:self)
    }
    
    override func showHighlighted()
    {
        super.showHighlighted()
        
        self.imageView.alpha = 0.3
    }
    
    override func showReleased()
    {
        super.showReleased()
        
        self.imageView.alpha = 1
    }
    
    //MARK: internal
    
    func config(model:PhotoOptionProtocol)
    {
        self.imageView.image = model.icon
        
        self.showState()
    }
}
