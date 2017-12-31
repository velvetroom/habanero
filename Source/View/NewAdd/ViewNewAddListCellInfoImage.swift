import UIKit

final class ViewNewAddListCellInfoImage:ViewNewAddListCellEditable
{
    private weak var imageView:UIImageView!
    
    override func factoryViews()
    {
        super.factoryViews()
        
        let placeholder:UIImageView = UIImageView()
        placeholder.isUserInteractionEnabled = false
        placeholder.translatesAutoresizingMaskIntoConstraints = false
        placeholder.clipsToBounds = true
        placeholder.contentMode = UIViewContentMode.center
        
        let imageView:UIImageView = UIImageView()
        imageView.isUserInteractionEnabled = false
        imageView.clipsToBounds = true
        imageView.contentMode = UIViewContentMode.scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        self.imageView = imageView
        
        self.addSubview(placeholder)
        self.addSubview(imageView)
        
        NSLayoutConstraint.equals(
            view:placeholder,
            toView:self)
        
        NSLayoutConstraint.equals(
            view:imageView,
            toView:self,
            margin:ViewNewAddList.Constants.marginHorizontal)
    }
    
    override func config(
        controller:ControllerNewAdd,
        model:NewAddSectionItemProtocol)
    {
        guard
        
            let model:NewAddSectionItemInfoImage = model as? NewAddSectionItemInfoImage
        
        else
        {
            return
        }
        
        self.imageView.image = model.image
    }
    
    override func selectorEdit()
    {
        
    }
}
