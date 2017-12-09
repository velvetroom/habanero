import UIKit

final class ViewMenuCell:ViewCollectionCell
{
    private weak var imageView:UIImageView!
    
    override init(frame:CGRect)
    {
        super.init(frame:frame)
        
        let imageView:UIImageView = UIImageView()
        imageView.isUserInteractionEnabled = false
        imageView.clipsToBounds = true
        imageView.contentMode = UIViewContentMode.center
        imageView.translatesAutoresizingMaskIntoConstraints = false
        self.imageView = imageView
        
        self.addSubview(imageView)
        
        NSLayoutConstraint.equals(
            view:imageView,
            toView:self)
    }
    
    required init?(coder:NSCoder)
    {
        return nil
    }
    
    override func showHighlighted()
    {
        self.imageView.tintColor = UIColor.colourBackgroundDark
    }
    
    override func showReleased()
    {
        self.imageView.tintColor = UIColor.colourBackgroundDark.withAlphaComponent(0.2)
    }
    
    //MARK: internal
    
    func config(model:MenuItemProtocol)
    {
        self.imageView.image = model.icon.withRenderingMode(UIImageRenderingMode.alwaysTemplate)
        self.showState()
    }
}
