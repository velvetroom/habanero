import UIKit

final class ViewNewAddListCellStepImage:ViewNewAddListCellStep
{
    private weak var label:UILabel!
    private weak var imageView:UIImageView!
    private weak var layoutImageWidth:NSLayoutConstraint!
    
    override func factoryViews()
    {
        super.factoryViews()
        
        let label:UILabel = UILabel()
        label.isUserInteractionEnabled = false
        label.translatesAutoresizingMaskIntoConstraints = false
        label.backgroundColor = UIColor.clear
        label.numberOfLines = 0
        label.font = UIFont.regular(size:ViewNewAddListCellStepImage.Constants.fontSize)
        label.textColor = UIColor.colourBackgroundDark
        self.label = label
        
        let imageView:UIImageView = UIImageView()
        imageView.isUserInteractionEnabled = false
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.clipsToBounds = true
        imageView.contentMode = UIViewContentMode.scaleAspectFit
        self.imageView = imageView
        
        self.addSubview(imageView)
        self.addSubview(label)
        
        NSLayoutConstraint.equalsVertical(
            view:label,
            toView:self)
        NSLayoutConstraint.leftToRight(
            view:label,
            toView:imageView,
            constant:ViewNewAddListCellStepImage.Constants.labelLeft)
        NSLayoutConstraint.rightToLeft(
            view:label,
            toView:self.actionsButton)
        
        NSLayoutConstraint.equalsVertical(
            view:imageView,
            toView:self)
        NSLayoutConstraint.leftToLeft(
            view:imageView,
            toView:self)
        layoutImageWidth = NSLayoutConstraint.width(
            view:imageView)
    }
    
    override func layoutSubviews()
    {
        let height:CGFloat = self.bounds.height
        self.layoutImageWidth.constant = height
        
        super.layoutSubviews()
    }
    
    override func config(
        controller:ControllerNewAdd,
        model:NewAddSectionItemProtocol)
    {
        super.config(
            controller:controller,
            model:model)
        
        guard
            
            let model:NewAddSectionItemStepImage = model as? NewAddSectionItemStepImage
            
        else
        {
            return
        }
        
        self.label.text = model.text
        self.imageView.image = model.image
    }
}
