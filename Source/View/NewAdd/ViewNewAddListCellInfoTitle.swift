import UIKit

final class ViewNewAddListCellInfoTitle:ViewNewAddListCell
{
    private weak var labelContent:UILabel!
    
    override func factoryViews()
    {
        super.factoryViews()
        
        let button:UIButton = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(
            self,
            action:#selector(self.selectorButton(sender:)),
            for:UIControlEvents.touchUpInside)
        
        let labelTitle:UILabel = UILabel()
        labelTitle.isUserInteractionEnabled = false
        labelTitle.translatesAutoresizingMaskIntoConstraints = false
        labelTitle.backgroundColor = UIColor.clear
        labelTitle.font = UIFont.regular(size:ViewNewAddListCellInfoTitle.Constants.titleFontSize)
        labelTitle.textColor = UIColor.colourBackgroundDark
        labelTitle.text = String.localizedView(key:"ViewNewAddListCellInfoTitle_labelTitle")
        
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
    }
    
    //MARK: selectors
    
    @objc
    private func selectorButton(sender button:UIButton)
    {
        
    }
}
