import UIKit

final class ViewPhotoCropDisplayImage:View<ArchPhotoCrop>
{
    weak var layoutTop:NSLayoutConstraint!
    weak var layoutBottom:NSLayoutConstraint!
    weak var layoutLeft:NSLayoutConstraint!
    weak var layoutRight:NSLayoutConstraint!
    
    override func factoryViews()
    {
        super.factoryViews()
        self.isUserInteractionEnabled = false
        self.layer.borderColor = UIColor(white:1, alpha:0.5).cgColor
        self.layer.borderWidth = ViewGlobal.Constants.borderWidth
        
        let imageView:UIImageView = UIImageView()
        imageView.isUserInteractionEnabled = false
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = UIViewContentMode.scaleAspectFit
        imageView.clipsToBounds = true
        imageView.image = self.controller.model.image
        
        self.addSubview(imageView)
        
        NSLayoutConstraint.equals(
            view:imageView,
            toView:self)
    }
}
