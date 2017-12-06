import UIKit

final class ViewMenuCell:UICollectionViewCell
{
    private weak var imageView:UIImageView!
    
    override init(frame:CGRect)
    {
        super.init(frame:frame)
        self.clipsToBounds = true
        self.backgroundColor = UIColor.clear
        
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
    
    override var isSelected:Bool
    {
        didSet
        {
            self.hover()
        }
    }
    
    override var isHighlighted:Bool
    {
        didSet
        {
            self.hover()
        }
    }
    
    //MARK: private
    
    private func hover()
    {
        if self.isSelected || self.isHighlighted
        {
            self.imageView.tintColor = UIColor.colourBackgroundDark
        }
        else
        {
            self.imageView.tintColor = UIColor.colourBackgroundDark.withAlphaComponent(0.2)
        }
    }
    
    //MARK: internal
    
    func config(model:MenuItemProtocol)
    {
        self.imageView.image = model.icon.withRenderingMode(UIImageRenderingMode.alwaysTemplate)
        self.hover()
    }
}
