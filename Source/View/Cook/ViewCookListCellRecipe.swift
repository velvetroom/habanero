import UIKit

final class ViewCookListCellRecipe:ViewCookListCell
{
    private weak var labelText:UILabel!
    private weak var labelDuration:UILabel!
    
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
        
        let imageDuration:UIImageView = UIImageView()
        imageDuration.isUserInteractionEnabled = false
        imageDuration.translatesAutoresizingMaskIntoConstraints = false
        imageDuration.clipsToBounds = true
        imageDuration.contentMode = UIViewContentMode.center
        imageDuration.image = #imageLiteral(resourceName: "assetCookDuration")
        
        let labelDuration:UILabel = UILabel()
        labelDuration.translatesAutoresizingMaskIntoConstraints = false
        labelDuration.backgroundColor = UIColor.clear
        labelDuration.font = UIFont.regular(size:ViewCookListCellRecipe.Constants.durationFontSize)
        labelDuration.textColor = UIColor.colourBackgroundDark
        labelDuration.isUserInteractionEnabled = false
        self.labelDuration = labelDuration
        
        self.addSubview(labelText)
        self.addSubview(imageDuration)
        self.addSubview(labelDuration)
        
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
        
        NSLayoutConstraint.bottomToBottom(
            view:imageDuration,
            toView:self,
            constant:ViewCookListCellRecipe.Constants.durationBottom)
        NSLayoutConstraint.size(
            view:imageDuration,
            constant:ViewCookListCellRecipe.Constants.durationSize)
        NSLayoutConstraint.leftToLeft(
            view:imageDuration,
            toView:self,
            constant:ViewCookList.Constants.marginHorizontal)
        
        NSLayoutConstraint.bottomToBottom(
            view:labelDuration,
            toView:self,
            constant:ViewCookListCellRecipe.Constants.durationBottom)
        NSLayoutConstraint.height(
            view:labelDuration,
            constant:ViewCookListCellRecipe.Constants.durationSize)
        NSLayoutConstraint.leftToRight(
            view:labelDuration,
            toView:imageDuration,
            constant:-ViewCookListCellRecipe.Constants.durationRight)
        NSLayoutConstraint.widthGreaterOrEqual(
            view:labelDuration)
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
        
        let duration:String? = Format.factoryDuration(duration:model.recipe.duration)
        self.labelDuration.text = duration
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
