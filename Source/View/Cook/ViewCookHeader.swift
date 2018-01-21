import UIKit

final class ViewCookHeader:View<ArchCook>
{
    private(set) weak var imageView:UIImageView!
    
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
        imageView.image = self.controller.model.cookItem?.image
        self.imageView = imageView
        
        let viewShadow:ViewGradient = ViewGradient.vertical(
            colourTop:UIColor(white:0, alpha:0.5),
            colourBottom:UIColor(white:0, alpha:0))
        
        let viewBorder:ViewBorder = ViewBorder(colour:UIColor.colourBackgroundDark)
        
        self.addSubview(imageView)
        self.addSubview(viewShadow)
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
        
        NSLayoutConstraint.topToTop(
            view:viewShadow,
            toView:self)
        NSLayoutConstraint.height(
            view:viewShadow,
            constant:ViewCookHeader.Constants.shadowHeight)
        NSLayoutConstraint.equalsHorizontal(
            view:viewShadow,
            toView:self)
    }
}
