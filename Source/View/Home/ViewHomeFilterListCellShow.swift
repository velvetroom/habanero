import UIKit

final class ViewHomeFilterListCellShow:ViewHomeFilterListCell
{
    private weak var button:UIButton!
    
    override func factoryViews()
    {
        super.factoryViews()
        
        self.labelTitle.textAlignment = NSTextAlignment.right
        self.labelTitle.text = String.localizedView(key:"ViewHomeFilterListCellShow_labelTitle")
        
        let button:UIButton = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(
            #imageLiteral(resourceName: "assetGenericFilterFavourites").withRenderingMode(UIImageRenderingMode.alwaysOriginal),
            for:UIControlState.normal)
        button.setImage(
            #imageLiteral(resourceName: "assetGenericFilterFavourites").withRenderingMode(UIImageRenderingMode.alwaysTemplate),
            for:UIControlState.highlighted)
        button.setImage(
            #imageLiteral(resourceName: "assetGenericFilterFavourites").withRenderingMode(UIImageRenderingMode.alwaysTemplate),
            for:UIControlState.selected)
        button.imageView!.clipsToBounds = true
        button.imageView!.contentMode = UIViewContentMode.center
        button.imageView!.tintColor = UIColor.colourHabanero
        button.addTarget(
            self,
            action:#selector(self.selectorButton(sender:)),
            for:UIControlEvents.touchUpInside)
        self.button = button
        
        self.addSubview(button)
        
        NSLayoutConstraint.equalsVertical(
            view:button,
            toView:self)
        NSLayoutConstraint.rightToRight(
            view:button,
            toView:self)
        NSLayoutConstraint.width(
            view:button,
            constant:ViewHomeFilterListCellShow.Constants.buttonWidth)
    }
    
    override func config(controller:ControllerHome)
    {
        super.config(controller:controller)
        
        controller.configFilterShow(viewCell:self)
    }
    
    //MARK: selectors
    
    @objc
    private func selectorButton(sender button:UIButton)
    {
        self.controller?.filterShowToggle(viewCell:self)
    }
    
    //MARK: internal
    
    func showAll()
    {
        self.button.isSelected = false
    }
    
    func showOnlyFavourites()
    {
        self.button.isSelected = true
    }
}
