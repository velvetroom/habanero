import UIKit

class ViewNewAddListCellText:ViewNewAddListCellEditable
{
    private(set) weak var labelTitle:UILabel!
    private(set) weak var labelContent:UILabel!
    
    override func factoryViews()
    {
        super.factoryViews()
        
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
}
