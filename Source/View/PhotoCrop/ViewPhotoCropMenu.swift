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
            for:UIControlState.normal)
        buttonCancel.titleLabel!.font = UIFont.medium(size:ViewPhotoCropMenu.Constants.cancelFontSize)
        buttonCancel.addTarget(
            self,
            action:#selector(self.selectorCancel(sender:)),
            for:UIControlEvents.touchUpInside)
        
        let buttonAccept:UIButton = UIButton()
        buttonAccept.translatesAutoresizingMaskIntoConstraints = false
        buttonAccept.setBackgroundImage(
            #imageLiteral(resourceName: "assetGenericButton"),
            for:UIControlState())
        
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
    
    override func layoutSubviews()
    {
        let width:CGFloat = self.bounds.width
        let remainCancel:CGFloat = width - ViewPhotoCropMenu.Constants.cancelWidth
        let remainAccept:CGFloat = width - ViewPhotoCropMenu.Constants.acceptWidth
        let cancelLeft:CGFloat = remainCancel / 2.0
        let acceptLeft:CGFloat = remainAccept / 2.0
        
        layoutAcceptLeft.constant = cancelLeft
        layoutCancelLeft.constant = acceptLeft
        
        super.layoutSubviews()
    }
    
    //MARK: selectors
    
    @objc
    private func selectorCancel(sender button:UIButton)
    {
        self.controller.transitionBack()
    }
}
