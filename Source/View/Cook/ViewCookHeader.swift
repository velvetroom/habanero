import UIKit

final class ViewCookHeader:View<ArchCook>
{
    override func factoryViews()
    {
        super.factoryViews()
        self.isUserInteractionEnabled = false
        
        let imageView:UIImageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.isUserInteractionEnabled = false
        imageView.clipsToBounds = true
        imageView.contentMode = UIViewContentMode.scaleAspectFill
        imageView.image = self.controller.model.item?.image
        
        self.addSubview(imageView)
        
        NSLayoutConstraint.equalsVertical(
            view:imageView,
            toView:self,
            margin:ViewCookHeader.Constants.verticalMargin)
        NSLayoutConstraint.equalsHorizontal(
            view:imageView,
            toView:self)
    }
}
