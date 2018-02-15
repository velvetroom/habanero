import UIKit

final class ViewHomeFilterListCellShow:ViewHomeFilterListCell
{
    private weak var button:UIButton!
    
    override func factoryViews()
    {
        super.factoryViews()
        
        let button:UIButton = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(
            #imageLiteral(resourceName: "assetGenericFilterFavorites").withRenderingMode(UIImageRenderingMode.alwaysOriginal),
            for:UIControlState.normal)
        button.setImage(
            #imageLiteral(resourceName: "assetGenericFilterFavorites").withRenderingMode(UIImageRenderingMode.alwaysTemplate),
            for:UIControlState.highlighted)
        button.imageView!.clipsToBounds = true
        button.imageView!.contentMode = UIViewContentMode.center
        button.imageView!.tintColor = UIColor.colourHabanero
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
}
