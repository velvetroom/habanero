import UIKit

class ViewNewAddListCellStep:ViewNewAddListCell, ViewNewAddListCellDraggrableProtocol
{
    private(set) weak var actionsButton:UIButton!
    private var model:NewAddSectionItemStepProtocol?
    
    override func factoryViews()
    {
        super.factoryViews()
        
        let actionsButton:UIButton = UIButton()
        actionsButton.translatesAutoresizingMaskIntoConstraints = false
        actionsButton.setImage(
            #imageLiteral(resourceName: "assetGenericRemove").withRenderingMode(UIImageRenderingMode.alwaysOriginal),
            for:UIControlState.normal)
        actionsButton.setImage(
            #imageLiteral(resourceName: "assetGenericRemove").withRenderingMode(UIImageRenderingMode.alwaysTemplate),
            for:UIControlState.highlighted)
        actionsButton.imageView!.tintColor = UIColor(white:0, alpha:0.2)
        actionsButton.imageView!.clipsToBounds = true
        actionsButton.imageView!.contentMode = UIViewContentMode.center
        actionsButton.addTarget(
            self,
            action:#selector(self.selectorActions(sender:)),
            for:UIControlEvents.touchUpInside)
        self.actionsButton = actionsButton
        
        self.addSubview(actionsButton)
        
        NSLayoutConstraint.topToTop(
            view:actionsButton,
            toView:self)
        NSLayoutConstraint.height(
            view:actionsButton,
            constant:ViewNewAddListCellStep.Constants.buttonHeight)
        NSLayoutConstraint.rightToRight(
            view:actionsButton,
            toView:self)
        NSLayoutConstraint.width(
            view:actionsButton,
            constant:ViewNewAddListCellStep.Constants.buttonWidth)
    }
    
    override func config(
        controller:ControllerNewAdd,
        model:NewAddSectionItemProtocol)
    {
        super.config(
            controller:controller,
            model:model)
        
        guard
            
            let model:NewAddSectionItemStepProtocol = model as? NewAddSectionItemStepProtocol
            
        else
        {
            return
        }
        
        self.model = model
    }
    
    //MARK: selectors
    
    @objc
    private func selectorActions(sender button:UIButton)
    {
        guard
        
            let model:NewAddSectionItemStepProtocol = self.model
        
        else
        {
            return
        }
        
        self.controller?.showActionsForStep(step:model)
    }
}
