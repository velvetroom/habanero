import UIKit

final class ViewCookListCellIngredientsTitle:ViewCookListCell
{
    override func factoryViews()
    {
        super.factoryViews()
        
        let labelTitle:UILabel = UILabel()
        labelTitle.isUserInteractionEnabled = false
        labelTitle.translatesAutoresizingMaskIntoConstraints = false
        labelTitle.backgroundColor = UIColor.clear
        labelTitle.font = UIFont.regular(size:ViewCookListCellIngredientsTitle.Constants.fontSize)
        labelTitle.textColor = UIColor.colourBackgroundDark
        labelTitle.text = String.localizedView(key:"ViewCookListCellIngredientsTitle_labelTitle")
        
        let viewBorder:ViewBorder = ViewBorder(colour:UIColor(white:0, alpha:0.2))
        
        self.addSubview(labelTitle)
        self.addSubview(viewBorder)
        
        NSLayoutConstraint.equalsVertical(
            view:labelTitle,
            toView:self)
        NSLayoutConstraint.leftToLeft(
            view:labelTitle,
            toView:self,
            constant:ViewCookList.Constants.marginHorizontal)
        NSLayoutConstraint.widthGreaterOrEqual(
            view:labelTitle)
        
        NSLayoutConstraint.bottomToBottom(
            view:viewBorder,
            toView:self)
        NSLayoutConstraint.height(
            view:viewBorder,
            constant:ViewGlobal.Constants.borderWidth)
        NSLayoutConstraint.equalsHorizontal(
            view:viewBorder,
            toView:self,
            margin:ViewCookList.Constants.marginHorizontal)
    }
}
