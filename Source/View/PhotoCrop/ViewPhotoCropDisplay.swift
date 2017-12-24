import UIKit

final class ViewPhotoCropDisplay:View<ArchPhotoCrop>
{
    private weak var viewImage:ViewPhotoCropDisplayImage!
    
    override func factoryViews()
    {
        super.factoryViews()
        
        let viewImage:ViewPhotoCropDisplayImage = ViewPhotoCropDisplayImage(controller:self.controller)
        self.viewImage = viewImage
        
        self.addSubview(viewImage)
        
        viewImage.layoutTop = NSLayoutConstraint.topToTop(
            view:viewImage,
            toView:self)
        viewImage.layoutLeft = NSLayoutConstraint.leftToLeft(
            view:viewImage,
            toView:self)
        viewImage.layoutRight = NSLayoutConstraint.rightToRight(
            view:viewImage,
            toView:self)
        viewImage.layoutBottom = NSLayoutConstraint.bottomToBottom(
            view:viewImage,
            toView:self)
    }
}
