import UIKit

final class ViewCookHeader:View<ArchCook>
{
    override func factoryViews()
    {
        super.factoryViews()
        self.isUserInteractionEnabled = false
        self.backgroundColor = UIColor.colourBackgroundGray
        
        let imageView:UIImageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.isUserInteractionEnabled = false
        imageView.clipsToBounds = true
        imageView.contentMode = UIViewContentMode.scaleAspectFill
        imageView.image = self.controller.model.item?.image
        
        let viewBorder:ViewBorder = ViewBorder(colour:UIColor.colourBackgroundDark)
        
        self.addSubview(imageView)
        self.addSubview(viewBorder)
        
        NSLayoutConstraint.equalsVertical(
            view:imageView,
            toView:self,
            margin:ViewCookHeader.Constants.verticalMargin)
        NSLayoutConstraint.equalsHorizontal(
            view:imageView,
            toView:self)
        
        NSLayoutConstraint.bottomToBottom(
            view:viewBorder,
            toView:self)
        NSLayoutConstraint.height(
            view:viewBorder,
            constant:ViewGlobal.Constants.borderWidth)
        NSLayoutConstraint.equalsHorizontal(
            view:viewBorder,
            toView:self)
    }
}
