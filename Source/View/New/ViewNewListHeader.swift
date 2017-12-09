import UIKit

final class ViewNewListHeader:ViewCollectionReusable
{
    override func factoryViews()
    {
        super.factoryViews()
        
        self.isUserInteractionEnabled = false
        
        let labelTitle:UILabel = UILabel()
        labelTitle.isUserInteractionEnabled = false
        labelTitle.translatesAutoresizingMaskIntoConstraints = false
        labelTitle.backgroundColor = UIColor.clear
        labelTitle.font = UIFont.regular(size:ViewNewListHeader.Constants.titleFontSize)
        labelTitle.textColor = UIColor(white:0, alpha:0.6)
        labelTitle.text = String.localizedView(key:"ViewNewListHeader_labelTitle")
        
        self.addSubview(labelTitle)
        
        NSLayoutConstraint.bottomToBottom(
            view:labelTitle,
            toView:self)
        NSLayoutConstraint.height(
            view:labelTitle,
            constant:ViewNewListHeader.Constants.titleHeight)
        NSLayoutConstraint.leftToLeft(
            view:labelTitle,
            toView:self,
            constant:ViewNewListHeader.Constants.titleLeft)
        NSLayoutConstraint.widthGreaterOrEqual(
            view:labelTitle)
    }
}
