import UIKit

final class ViewNewAddListCellInfoTitle:ViewNewAddListCell
{
    private weak var button:UIButton!
    private weak var labelContent:UILabel!
    
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
            for:UIControlEvents.touchUpOutside)
        self.button = button
        
        let labelTitle:UILabel = UILabel()
        labelTitle.isUserInteractionEnabled = false
        labelTitle.translatesAutoresizingMaskIntoConstraints = false
        labelTitle.backgroundColor = UIColor.clear
        labelTitle.font = UIFont.regular(size:ViewNewAddListCellInfoTitle.Constants.titleFontSize)
        labelTitle.textColor = UIColor.colourBackgroundDark
        labelTitle.text = String.localizedView(key:"ViewNewAddListCellInfoTitle_labelTitle")
        
        let labelContent:UILabel = UILabel()
        labelContent.isUserInteractionEnabled = false
        labelContent.translatesAutoresizingMaskIntoConstraints = false
        labelContent.backgroundColor = UIColor.clear
        labelContent.font = UIFont.regular(size:ViewNewAddListCellInfoTitle.Constants.contentFontSize)
        labelContent.textColor = UIColor(white:0, alpha:0.6)
        labelTitle.numberOfLines = 0
        self.labelContent = labelContent
        
        self.addSubview(labelTitle)
        self.addSubview(button)
        
        NSLayoutConstraint.topToTop(
            view:labelTitle,
            toView:self,
            constant:ViewNewAddListCellInfoTitle.Constants.titleTop)
        NSLayoutConstraint.height(
            view:labelTitle,
            constant:ViewNewAddListCellInfoTitle.Constants.titleHeight)
        NSLayoutConstraint.leftToLeft(
            view:labelTitle,
            toView:self,
            constant:ViewNewAddList.Constants.marginHorizontal)
        NSLayoutConstraint.widthGreaterOrEqual(
            view:labelTitle)
        
        NSLayoutConstraint.equals(
            view:button,
            toView:self)
        
        NSLayoutConstraint.topToBottom(
            view:labelContent,
            toView:self)
        NSLayoutConstraint.heightGreaterOrEqual(
            view:labelContent)
        NSLayoutConstraint.leftToLeft(
            view:labelContent,
            toView:self,
            constant:ViewNewAddList.Constants.marginHorizontal)
        NSLayoutConstraint.rightToRight(
            view:labelContent,
            toView:self,
            constant:-ViewNewAddList.Constants.marginHorizontal)
    }
    
    override func config(
        controller:ControllerNewAdd,
        model:NewAddSectionItemProtocol)
    {
        guard
            
            let model:NewAddSectionItemInfoTitle = model as? NewAddSectionItemInfoTitle
        
        else
        {
            return
        }
        
        self.labelContent.text = model.title
    }
    
    //MARK: selectors
    
    @objc
    private func selectorButtonTouch(sender button:UIButton)
    {
        self.showReleased()
        self.controller?.editInfoTitle()
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
    
    //MARK: private
    
    private func showHighlighted()
    {
        self.button.backgroundColor = UIColor(white:1, alpha:0.9)
    }
    
    private func showReleased()
    {
        self.button.backgroundColor = UIColor.clear
    }
}
