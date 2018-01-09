import UIKit

final class ViewPhotoCropDisplay:View<ArchPhotoCrop>
{
    private(set) weak var viewShade:ViewPhotoCropDisplayShade!
    private(set) weak var viewImage:ViewPhotoCropDisplayImage!
    
    override func factoryViews()
    {
        super.factoryViews()
        
        let viewImage:ViewPhotoCropDisplayImage = ViewPhotoCropDisplayImage(controller:self.controller)
        self.viewImage = viewImage
        
        let viewShade:ViewPhotoCropDisplayShade = ViewPhotoCropDisplayShade(controller:self.controller)
        self.viewShade = viewShade
        
        self.addSubview(viewImage)
        self.addSubview(viewShade)

        NSLayoutConstraint.equals(
            view:viewImage,
            toView:self)
        
        NSLayoutConstraint.equals(
            view:viewShade,
            toView:self)
    }
}
