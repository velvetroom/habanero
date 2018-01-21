import UIKit

final class ViewCookStepBar:View<ArchCookStep>
{
    override func factoryViews()
    {
        super.factoryViews()
        
        let buttonClose:UIButton = UIButton()
        buttonClose.translatesAutoresizingMaskIntoConstraints = false
        buttonClose.setImage(
            #imageLiteral(resourceName: "assetGenericClose").withRenderingMode(UIImageRenderingMode.alwaysOriginal),
            for:UIControlState.normal)
        buttonClose.setImage(
            #imageLiteral(resourceName: "assetGenericClose").withRenderingMode(UIImageRenderingMode.alwaysTemplate),
            for:UIControlState.highlighted)
        buttonClose.imageView!.tintColor = UIColor(white:0, alpha:0.2)
        buttonClose.imageView!.clipsToBounds = true
        buttonClose.imageView!.contentMode = UIViewContentMode.center
        buttonClose.addTarget(
            self,
            action:#selector(self.selectorClose(sender:)),
            for:UIControlEvents.touchUpInside)
        
        let labelTitle:UILabel = UILabel()
        labelTitle.translatesAutoresizingMaskIntoConstraints = false
        labelTitle.backgroundColor = UIColor.clear
        labelTitle.textAlignment = NSTextAlignment.right
        labelTitle.isUserInteractionEnabled = false
        labelTitle.font = UIFont.regular(size:ViewCookStepBar.Constants.fontSize)
        labelTitle.textColor = UIColor.colourBackgroundDark
        labelTitle.text = self.controller.model.cookItem?.recipe.title
        
        self.addSubview(labelTitle)
        self.addSubview(buttonClose)
        
        NSLayoutConstraint.topToTop(
            view:buttonClose,
            toView:self,
            constant:ViewGlobal.Constants.contentTop)
        NSLayoutConstraint.bottomToBottom(
            view:buttonClose,
            toView:self)
        NSLayoutConstraint.leftToLeft(
            view:buttonClose,
            toView:self)
        NSLayoutConstraint.width(
            view:buttonClose,
            constant:ViewCookStepBar.Constants.closeWidth)
        
        NSLayoutConstraint.topToTop(
            view:labelTitle,
            toView:self,
            constant:ViewGlobal.Constants.contentTop)
        NSLayoutConstraint.bottomToBottom(
            view:labelTitle,
            toView:self)
        NSLayoutConstraint.rightToRight(
            view:labelTitle,
            toView:self,
            constant:ViewCookStepBar.Constants.titleRight)
        NSLayoutConstraint.widthGreaterOrEqual(
            view:labelTitle)
    }
    
    //MARK: selectors
    
    @objc
    private func selectorClose(sender button:UIButton)
    {
        self.controller.transitionClose()
    }
}
