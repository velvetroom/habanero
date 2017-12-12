import UIKit

final class ViewNewAddIngredientListHeader:ViewCollectionReusable
{
    override func factoryViews()
    {
        super.factoryViews()
        self.isUserInteractionEnabled = false
        
        let labelTitle:UILabel = UILabel()
        labelTitle.isUserInteractionEnabled = false
        labelTitle.translatesAutoresizingMaskIntoConstraints = false
        labelTitle.backgroundColor = UIColor.clear
        labelTitle.numberOfLines = 0
        labelTitle.textAlignment = NSTextAlignment.center
        labelTitle.font = UIFont.regular(size:ViewNewAddIngredientListHeader.Constants.fontSize)
        labelTitle.text = String.localizedView(key:"ViewNewAddIngredientListHeader_labelTitle")
        self.addSubview(labelTitle)
        
        NSLayoutConstraint.bottomToBottom(
            view:labelTitle,
            toView:self)
        NSLayoutConstraint.height(
            view:labelTitle,
            constant:ViewNewAddIngredientListHeader.Constants.titleHeight)
        NSLayoutConstraint.equalsHorizontal(
            view:labelTitle,
            toView:self,
            margin:ViewNewAddIngredientListHeader.Constants.titleMarginHorizontal)
    }
}
