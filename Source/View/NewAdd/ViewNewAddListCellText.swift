import UIKit

class ViewNewAddListCellText:ViewNewAddListCell
{
    private weak var button:UIButton!
    private(set) weak var labelTitle:UILabel!
    private(set) weak var labelContent:UILabel!
    
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
            for:UIControlEvents([
                UIControlEvents.touchCancel,
                UIControlEvents.touchUpOutside]))
        self.button = button
        
        let labelTitle:UILabel = UILabel()
        labelTitle.isUserInteractionEnabled = false
        labelTitle.translatesAutoresizingMaskIntoConstraints = false
        labelTitle.backgroundColor = UIColor.clear
        labelTitle.font = UIFont.regular(size:ViewNewAddListCellText.Constants.titleFontSize)
        labelTitle.textColor = UIColor.colourBackgroundDark
        self.labelTitle = labelTitle
        
        let labelContent:UILabel = UILabel()
        labelContent.isUserInteractionEnabled = false
        labelContent.translatesAutoresizingMaskIntoConstraints = false
        labelContent.backgroundColor = UIColor.clear
        labelContent.font = UIFont.regular(size:ViewNewAddListCellText.Constants.contentFontSize)
        labelContent.textColor = UIColor(white:0, alpha:0.5)
        labelContent.numberOfLines = 0
        self.labelContent = labelContent
        
        self.addSubview(labelTitle)
        self.addSubview(labelContent)
        self.addSubview(button)
        
        NSLayoutConstraint.topToTop(
            view:labelTitle,
            toView:self,
            constant:ViewNewAddListCellText.Constants.titleTop)
        NSLayoutConstraint.height(
            view:labelTitle,
            constant:ViewNewAddListCellText.Constants.titleHeight)
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
            toView:labelTitle)
        NSLayoutConstraint.heightGreaterOrEqual(
            view:labelContent)
        NSLayoutConstraint.equalsHorizontal(
            view:labelContent,
            toView:self,
            margin:ViewNewAddList.Constants.marginHorizontal)
    }
    
    override func showHighlighted()
    {
        super.showHighlighted()
        
        self.button.backgroundColor = UIColor(white:1, alpha:0.9)
    }
    
    override func showReleased()
    {
        super.showReleased()
        
        self.button.backgroundColor = UIColor.clear
    }
    
    //MARK: selectors
    
    @objc
    private func selectorButtonTouch(sender button:UIButton)
    {
        self.showReleased()
        self.editText()
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
    
    //MARK: internal
    
    func editText() { }
}
