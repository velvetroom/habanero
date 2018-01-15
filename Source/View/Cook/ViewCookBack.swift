import UIKit

final class ViewCookBack:View<ArchCook>
{
    override func factoryViews()
    {
        super.factoryViews()
        
        let button:UIButton = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(
            #imageLiteral(resourceName: "assetCookBackReleased"),
            for:UIControlState.normal)
        button.setImage(
            #imageLiteral(resourceName: "assetCookBackHighlighted"),
            for:UIControlState.highlighted)
        button.setImage(
            #imageLiteral(resourceName: "assetCookBackHighlighted"),
            for:UIControlState.selected)
        button.imageView!.clipsToBounds = true
        button.imageView!.contentMode = UIViewContentMode.center
        
        self.addSubview(button)
        
        NSLayoutConstraint.equals(
            view:button,
            toView:self)
    }
}
