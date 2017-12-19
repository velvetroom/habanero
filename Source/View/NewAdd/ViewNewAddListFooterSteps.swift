import UIKit

final class ViewNewAddListFooterSteps:ViewNewAddListFooter
{
    override func factoryViews()
    {
        super.factoryViews()
        
        let labelTitle:UILabel = UILabel()
        labelTitle.isUserInteractionEnabled = false
        labelTitle.translatesAutoresizingMaskIntoConstraints = false
        labelTitle.backgroundColor = UIColor.clear
        labelTitle.font = UIFont.regular(size:ViewNewAddListFooterSteps.Constants.titleFontSize)
        labelTitle.textColor = UIColor.colourBackgroundDark
        labelTitle.text = String.localizedView(key:"ViewNewAddListFooterSteps_labelTitle")
        
        let buttonAddImage:UIButton = UIButton()
        buttonAddImage.translatesAutoresizingMaskIntoConstraints = false
        buttonAddImage.setImage(
            #imageLiteral(resourceName: "assetNewStepImage").withRenderingMode(UIImageRenderingMode.alwaysTemplate),
            for:UIControlState.normal)
        buttonAddImage.setImage(
            #imageLiteral(resourceName: "assetNewStepImage").withRenderingMode(UIImageRenderingMode.alwaysOriginal),
            for:UIControlState.highlighted)
        buttonAddImage.imageView!.clipsToBounds = true
        buttonAddImage.imageView!.contentMode = UIViewContentMode.center
        buttonAddImage.imageView!.tintColor = UIColor.colourSuccess
        buttonAddImage.addTarget(
            self,
            action:#selector(self.selectorButtonAddImage(sender:)),
            for:UIControlEvents.touchUpInside)
        
        let buttonAddText:UIButton = UIButton()
        buttonAddText.translatesAutoresizingMaskIntoConstraints = false
        buttonAddText.setImage(
            #imageLiteral(resourceName: "assetNewStepText").withRenderingMode(UIImageRenderingMode.alwaysTemplate),
            for:UIControlState.normal)
        buttonAddText.setImage(
            #imageLiteral(resourceName: "assetNewStepText").withRenderingMode(UIImageRenderingMode.alwaysOriginal),
            for:UIControlState.highlighted)
        buttonAddText.imageView!.clipsToBounds = true
        buttonAddText.imageView!.contentMode = UIViewContentMode.center
        buttonAddText.imageView!.tintColor = UIColor.colourSuccess
        buttonAddText.addTarget(
            self,
            action:#selector(self.selectorButtonAddText(sender:)),
            for:UIControlEvents.touchUpInside)
        
        self.addSubview(labelTitle)
        self.addSubview(buttonAddImage)
        self.addSubview(buttonAddText)
        
        NSLayoutConstraint.topToTop(
            view:labelTitle,
            toView:self,
            constant:ViewNewAddListFooterSteps.Constants.buttonTop)
        NSLayoutConstraint.height(
            view:labelTitle,
            constant:ViewNewAddListFooterSteps.Constants.buttonHeight)
        NSLayoutConstraint.leftToLeft(
            view:labelTitle,
            toView:self,
            constant:ViewNewAddListFooterSteps.Constants.titleLeft)
        NSLayoutConstraint.widthGreaterOrEqual(
            view:buttonAddImage)
        
        NSLayoutConstraint.topToTop(
            view:buttonAddImage,
            toView:self,
            constant:ViewNewAddListFooterSteps.Constants.buttonTop)
        NSLayoutConstraint.height(
            view:buttonAddImage,
            constant:ViewNewAddListFooterSteps.Constants.buttonHeight)
        NSLayoutConstraint.leftToRight(
            view:buttonAddImage,
            toView:labelTitle,
            constant:ViewNewAddListFooterSteps.Constants.buttonLeft)
        NSLayoutConstraint.width(
            view:buttonAddImage,
            constant:ViewNewAddListFooterSteps.Constants.buttonWidth)
        
        NSLayoutConstraint.topToTop(
            view:buttonAddText,
            toView:self,
            constant:ViewNewAddListFooterSteps.Constants.buttonTop)
        NSLayoutConstraint.height(
            view:buttonAddText,
            constant:ViewNewAddListFooterSteps.Constants.buttonHeight)
        NSLayoutConstraint.leftToRight(
            view:buttonAddText,
            toView:buttonAddImage)
        NSLayoutConstraint.width(
            view:buttonAddText,
            constant:ViewNewAddListFooterSteps.Constants.buttonWidth)
    }
    
    //MARK: selectors
    
    @objc
    private func selectorButtonAddImage(sender button:UIButton)
    {
        self.controller?.addStepImage()
    }
    
    @objc
    private func selectorButtonAddText(sender button:UIButton)
    {
        self.controller?.addStepText()
    }
}
