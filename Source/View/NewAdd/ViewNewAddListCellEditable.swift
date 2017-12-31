import UIKit

class ViewNewAddListCellEditable:ViewNewAddListCell
{
    private weak var button:UIButton!
    
    override func factoryViews()
    {
        super.factoryViews()
        
        let button:UIButton = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(
            self,
            action:#selector(self.selectorButtonTouch(sender:)),
            for:UIControlEvents.touchUpInside)
        button.addTarget(
            self,
            action:#selector(self.selectorButtonHighlighted(sender:)),
            for:UIControlEvents.touchDown)
        button.addTarget(
            self,
            action:#selector(self.selectorButtonReleased(sender:)),
            for:UIControlEvents([
                UIControlEvents.touchCancel,
                UIControlEvents.touchUpOutside]))
        self.button = button

        self.addSubview(button)
        
        NSLayoutConstraint.equals(
            view:button,
            toView:self)
    }
    
    override func showHighlighted()
    {
        super.showHighlighted()
        
        self.button.backgroundColor = UIColor(white:1, alpha:0.9)
    }
    
    override func showReleased()
    {
        super.showReleased()
        
        self.button.backgroundColor = UIColor.clear
    }
    
    override func config(
        controller:ControllerNewAdd,
        model:NewAddSectionItemProtocol)
    {
        super.config(
            controller:controller,
            model:model)
        
        self.bringSubview(toFront:self.button)
    }
    
    //MARK: selectors
    
    @objc
    private func selectorButtonTouch(sender button:UIButton)
    {
        self.showReleased()
        self.selectorEdit()
    }
    
    @objc
    private func selectorButtonHighlighted(sender button:UIButton)
    {
        self.showHighlighted()
    }
    
    @objc
    private func selectorButtonReleased(sender button:UIButton)
    {
        self.showReleased()
    }
    
    //MARK: internal
    
    func selectorEdit() { }
}
