import UIKit

final class ViewTextBar:View<ArchText>
{
    override func factoryViews()
    {
        super.factoryViews()
        
        self.backgroundColor = UIColor.colourHabanero
        
        let button:UIButton = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle(
            String.localizedView(key:"ViewTextBar_button"),
            for:UIControlState())
        button.setTitleColor(
            UIColor.white,
            for:UIControlState.normal)
        button.setTitleColor(
            UIColor(white:1, alpha:0.2),
            for:UIControlState.highlighted)
        button.titleLabel!.font = UIFont.bold(size:ViewTextBar.Constants.buttonFontSize)
        button.addTarget(
            self,
            action:#selector(self.selectorButton(sender:)),
            for:UIControlEvents.touchUpInside)
        
        self.addSubview(button)
        
        NSLayoutConstraint.equalsVertical(
            view:button,
            toView:self)
        NSLayoutConstraint.rightToRight(
            view:button,
            toView:self)
        NSLayoutConstraint.width(
            view:button,
            constant:ViewTextBar.Constants.buttonWidth)
    }
    
    //MARK: selectors
    
    @objc
    private func selectorButton(sender button:UIButton)
    {
        self.controller.doneEditing()
    }
}
