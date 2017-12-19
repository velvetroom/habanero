import UIKit

final class ViewNewAddListFooterSteps:ViewNewAddListFooter
{
    override func factoryViews()
    {
        super.factoryViews()
        
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
        
        self.addSubview(buttonAddImage)
        self.addSubview(buttonAddText)
        
        NSLayoutConstraint.topToTop(
            view:buttonAddImage,
            toView:self,
            constant:ViewNewAddListFooterSteps.Constants.buttonTop)
        NSLayoutConstraint.height(
            view:buttonAddImage,
            constant:ViewNewAddListFooterSteps.Constants.buttonHeight)
        NSLayoutConstraint.leftToLeft(
            view:buttonAddImage,
            toView:self,
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
