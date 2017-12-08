import UIKit

final class ViewTextBar:View<ArchText>
{
    required init(controller:ControllerText)
    {
        super.init(controller:controller)
        self.backgroundColor = UIColor.colourHabanero
        
        self.factoryViews()
    }
    
    required init?(coder:NSCoder)
    {
        return nil
    }
    
    //MARK: selectors
    
    @objc
    private func selectorButton(sender button:UIButton)
    {
        self.controller.model.view?.viewInput.resignFirstResponder()
    }
    
    //MARK: private
    
    private func factoryViews()
    {
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
}
