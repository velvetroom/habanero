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
        labelText.numberOfLines = 0
        self.labelText = labelText
        
        self.addSubview(labelText)
        
        NSLayoutConstraint.topToTop(
            view:labelText,
            toView:self,
            constant:ViewCookList.Constants.marginHorizontal)
        NSLayoutConstraint.heightGreaterOrEqual(
            view:labelText)
        NSLayoutConstraint.equalsHorizontal(
            view:labelText,
            toView:self,
            margin:ViewCookList.Constants.marginHorizontal)
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
        
        let recipeText:NSAttributedString = ViewCookListCellRecipe.factoryRecipeText(recipe:model.recipe)
        self.labelText.attributedText = recipeText
    }
    
    //MARK: private
    
    private class func factoryRecipeText(recipe:Recipe) -> NSAttributedString
    {
        let title:NSAttributedString = ViewCookListCellRecipe.factoryRecipeTitle(recipe:recipe)
        let subtitle:NSAttributedString = ViewCookListCellRecipe.factoryRecipeSubtitle(recipe:recipe)
        
        let text:NSMutableAttributedString = NSMutableAttributedString()
        text.append(title)
        text.appendNewLine()
        text.append(subtitle)
        
        return text
    }
    
    private class func factoryRecipeTitle(recipe:Recipe) -> NSAttributedString
    {
        let attributes:[NSAttributedStringKey:Any] = [
            NSAttributedStringKey.font:UIFont.bold(size:ViewCookListCellRecipe.Constants.titleFontSize),
            NSAttributedStringKey.foregroundColor:UIColor.colourBackgroundDark]
        
        let title:NSAttributedString = NSAttributedString(
            string:recipe.title,
            attributes:attributes)
        
        return title
    }
    
    private class func factoryRecipeSubtitle(recipe:Recipe) -> NSAttributedString
    {
        let attributes:[NSAttributedStringKey:Any] = [
            NSAttributedStringKey.font:UIFont.regular(size:ViewCookListCellRecipe.Constants.subtitleFontSize),
            NSAttributedStringKey.foregroundColor:UIColor(white:0, alpha:0.5)]
        
        let subtitle:NSAttributedString = NSAttributedString(
            string:recipe.subtitle,
            attributes:attributes)
        
        return subtitle
    }
}
