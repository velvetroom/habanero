import UIKit

final class ViewCookListCellRecipe:ViewCookListCell
{
    private weak var labelText:UILabel!
    
    override func factoryViews()
    {
        super.factoryViews()
        
        let labelText:UILabel = UILabel()
        labelText.translatesAutoresizingMaskIntoConstraints = false
        labelText.isUserInteractionEnabled = false
        labelText.backgroundColor = UIColor.clear
        labelText.font = UIFont.bold(size:ViewCookListCellRecipe.Constants.titleFontSize)
        labelText.textColor = UIColor.colourBackgroundDark
        self.labelText = labelText
        
        self.addSubview(labelText)
        
        NSLayoutConstraint.topToTop(
            view:labelText,
            toView:self)
        NSLayoutConstraint.heightGreaterOrEqual(
            view:labelText)
        NSLayoutConstraint.equalsHorizontal(
            view:labelText,
            toView:self,
            margin:ViewCookListCellRecipe.Constants.titleHeight)
    }
    
    override func config(model:CookItemProtocol)
    {
        super.config(model:model)
        
        guard
        
            let model:CookItemRecipe = model as? CookItemRecipe
        
        else
        {
            return
        }
        
        self.labelText.text = model.recipe.title
    }
}
