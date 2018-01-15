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
        button.addTarget(
            self,
            action:#selector(self.selectorBack(sender:)),
            for:UIControlEvents.touchUpInside)
        
        self.addSubview(button)
        
        NSLayoutConstraint.equals(
            view:button,
            toView:self)
    }
    
    //MARK: selectors
    
    @objc
    private func selectorBack(sender button:UIButton)
    {
        self.controller.transitionBack()
    }
}
