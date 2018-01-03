import UIKit

final class ViewNewAddBar:ViewBarBack<ArchNewAdd>
{
    override func factoryViews()
    {
        super.factoryViews()
        
        let buttonDone:UIButton = UIButton()
        buttonDone.translatesAutoresizingMaskIntoConstraints = false
        buttonDone.setTitleColor(
            UIColor.colourSuccess,
            for:UIControlState.normal)
        buttonDone.setTitleColor(
            UIColor.colourBackgroundDark,
            for:UIControlState.highlighted)
        buttonDone.setTitle(
            String.localizedView(key:"ViewNewAddBar_buttonDone"),
            for:UIControlState())
        buttonDone.titleLabel!.font = UIFont.bold(size:ViewGlobal.Constants.barTitleFontSize)
        buttonDone.addTarget(
            self,
            action:#selector(self.selectorButtonAdd(sender:)),
            for:UIControlEvents.touchUpInside)
        
        self.labelTitle.text = String.localizedView(key:"ViewNewAddBar_labelTitle")
        
        self.addSubview(buttonDone)
        
        NSLayoutConstraint.topToTop(
            view:buttonDone,
            toView:self,
            constant:ViewGlobal.Constants.contentTop)
        NSLayoutConstraint.bottomToBottom(
            view:buttonDone,
            toView:self)
        NSLayoutConstraint.rightToRight(
            view:buttonDone,
            toView:self)
        NSLayoutConstraint.width(
            view:buttonDone,
            constant:ViewNewAddBar.Constants.buttonDoneWidth)
    }
    
    override func selectorButtonBack(sender button:UIButton)
    {
        self.controller.transitionBack()
    }
    
    //MARK: selectors
    
    @objc
    private func selectorButtonAdd(sender button:UIButton)
    {
        self.controller.createRecipe()
    }
}
