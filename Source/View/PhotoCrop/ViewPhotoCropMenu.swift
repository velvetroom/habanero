import UIKit

final class ViewPhotoCropMenu:View<ArchPhotoCrop>
{
    private weak var layoutCancelLeft:NSLayoutConstraint!
    
    override func factoryViews()
    {
        super.factoryViews()
        self.backgroundColor = UIColor.white
        
        let buttonCancel:UIButton = UIButton()
        buttonCancel.translatesAutoresizingMaskIntoConstraints = false
        buttonCancel.setTitleColor(
            UIColor.colourBackgroundDark.withAlphaComponent(0.5),
            for:UIControlState.normal)
        buttonCancel.setTitleColor(
            UIColor.colourBackgroundGray,
            for:UIControlState.highlighted)
        buttonCancel.setTitle(
            String.localizedView(key:"ViewPhotoCropMenu_buttonCancel"),
            for:UIControlState.normal)
        buttonCancel.titleLabel!.font = UIFont.medium(size:ViewPhotoCropMenu.Constants.cancelFontSize)
        buttonCancel.addTarget(
            self,
            action:#selector(self.selectorCancel(sender:)),
            for:UIControlEvents.touchUpInside)
        
        self.addSubview(buttonCancel)
        
        NSLayoutConstraint.topToTop(
            view:buttonCancel,
            toView:self,
            constant:ViewPhotoCropMenu.Constants.cancelTop)
        NSLayoutConstraint.height(
            view:buttonCancel,
            constant:ViewPhotoCropMenu.Constants.cancelHeight)
        layoutCancelLeft = NSLayoutConstraint.leftToLeft(
            view:buttonCancel,
            toView:self)
        NSLayoutConstraint.width(
            view:buttonCancel,
            constant:ViewPhotoCropMenu.Constants.cancelWidth)
    }
    
    //MARK: selectors
    
    @objc
    private func selectorCancel(sender button:UIButton)
    {
        self.controller.transitionBack()
    }
}
