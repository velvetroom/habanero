import UIKit

final class ViewNewAddListCellStepText:ViewNewAddListCell
{
    private weak var label:UILabel!
    
    override func factoryViews()
    {
        super.factoryViews()
        
        let label:UILabel = UILabel()
        label.isUserInteractionEnabled = false
        label.translatesAutoresizingMaskIntoConstraints = false
        label.backgroundColor = UIColor.clear
        label.numberOfLines = 0
        label.font = UIFont.regular(size:)
        label.textColor = UIColor.colourBackgroundDark
        self.label = label
        
        let removeButton:UIButton = UIButton()
        removeButton.translatesAutoresizingMaskIntoConstraints = false
        removeButton.setImage(
            #imageLiteral(resourceName: "assetGenericRemove").withRenderingMode(UIImageRenderingMode.alwaysOriginal),
            for:UIControlState.normal)
        removeButton.setImage(
            #imageLiteral(resourceName: "assetGenericRemove").withRenderingMode(UIImageRenderingMode.alwaysTemplate),
            for:UIControlState.highlighted)
        removeButton.imageView!.tintColor = UIColor(white:0, alpha:0.2)
        removeButton.imageView!.clipsToBounds = true
        removeButton.imageView!.contentMode = UIViewContentMode.center
        removeButton.addTarget(
            self,
            action:#selector(self.selectorRemove(sender:)),
            for:UIControlEvents.touchUpInside)
        
        self.addSubview(label)
        self.addSubview(removeButton)
        
        NSLayoutConstraint.equalsVertical(
            view:label,
            toView:self)
        NSLayoutConstraint.leftToLeft(
            view:label,
            toView:self,
            constant:ViewNewAddList.Constants.marginHorizontal)
        NSLayoutConstraint.rightToLeft(
            view:label,
            toView:removeButton)
        
        NSLayoutConstraint.equalsVertical(
            view:removeButton,
            toView:self)
        NSLayoutConstraint.rightToRight(
            view:removeButton,
            toView:self)
        NSLayoutConstraint.width(
            view:removeButton,
            constant:ViewNewAddListCellIngredient.Constants.buttonWidth)
    }
    
    override func config(
        controller:ControllerNewAdd,
        model:NewAddSectionItemProtocol)
    {
        super.config(
            controller:controller,
            model:model)
        
        guard
            
            let model:NewAddSectionItemIngredient = model as? NewAddSectionItemIngredient
            
        else
        {
            return
        }
    }
    
    //MARK: selectors
    
    @objc
    private func selectorRemove(sender button:UIButton)
    {
        guard
            
            let model:NewAddSectionItemIngredient = self.model
            
        else
        {
            return
        }
        
        self.controller?.removeIngredient(item:model)
    }
}
