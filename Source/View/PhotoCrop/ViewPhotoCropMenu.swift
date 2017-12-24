import UIKit

final class ViewPhotoCropMenu:View<ArchPhotoCrop>
{
    private weak var layoutCancelLeft:NSLayoutConstraint!
    private weak var layoutAcceptLeft:NSLayoutConstraint!
    
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
            for:UIControlState())
        buttonCancel.titleLabel!.font = UIFont.medium(size:ViewPhotoCropMenu.Constants.cancelFontSize)
        buttonCancel.addTarget(
            self,
            action:#selector(self.selectorCancel(sender:)),
            for:UIControlEvents.touchUpInside)
        
        let buttonAccept:ViewButtonContinue = ViewButtonContinue()
        buttonAccept.setTitle(
            String.localizedView(key:"ViewPhotoCropMenu_buttonAccept"),
            for:UIControlState())
        buttonAccept.addTarget(
            self,
            action:#selector(self.selectorAccept(sender:)),
            for:UIControlEvents.touchUpInside)
        
        self.addSubview(buttonCancel)
        self.addSubview(buttonAccept)
        
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
        
        NSLayoutConstraint.topToBottom(
            view:buttonAccept,
            toView:buttonCancel)
        layoutAcceptLeft = NSLayoutConstraint.leftToLeft(
            view:buttonAccept,
            toView:self)
    }
    
    override func layoutSubviews()
    {
        let width:CGFloat = self.bounds.width
        let remainCancel:CGFloat = width - ViewPhotoCropMenu.Constants.cancelWidth
        let remainAccept:CGFloat = width - ViewButtonContinue.Constants.width
        let cancelLeft:CGFloat = remainCancel / 2.0
        let acceptLeft:CGFloat = remainAccept / 2.0
        
        layoutCancelLeft.constant = cancelLeft
        layoutAcceptLeft.constant = acceptLeft
        
        super.layoutSubviews()
    }
    
    //MARK: selectors
    
    @objc
    private func selectorCancel(sender button:UIButton)
    {
        self.controller.transitionBack()
    }
    
    @objc
    private func selectorAccept(sender button:UIButton)
    {
        self.controller.transitionBack()
    }
}
