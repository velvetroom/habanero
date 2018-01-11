import UIKit

final class ViewCookListCellTitle:ViewCookListCell
{
    private weak var labelTitle:UILabel!
    
    override func factoryViews()
    {
        super.factoryViews()
        
        let labelTitle:UILabel = UILabel()
        labelTitle.translatesAutoresizingMaskIntoConstraints = false
        labelTitle.isUserInteractionEnabled = false
        labelTitle.backgroundColor = UIColor.clear
        labelTitle.font = UIFont.bold(size:ViewCookListCellTitle.Constants.titleFontSize)
        labelTitle.textColor = UIColor.colourBackgroundDark
        self.labelTitle = labelTitle
        
        self.addSubview(labelTitle)
        
        NSLayoutConstraint.topToTop(
            view:labelTitle,
            toView:self)
        NSLayoutConstraint.height(
            view:labelTitle,
            constant:ViewCookListCellTitle.Constants.titleHeight)
        NSLayoutConstraint.leftToLeft(
            view:labelTitle,
            toView:self,
            constant:ViewCookList.Constants.marginHorizontal)
        NSLayoutConstraint.widthGreaterOrEqual(
            view:labelTitle)
    }
    
    override func config(model:CookItemProtocol)
    {
        super.config(model:model)
        
        guard
        
            let model:CookItemTitle = model as? CookItemTitle
        
        else
        {
            return
        }
        
        self.labelTitle.text = model.recipe.title
    }
}
