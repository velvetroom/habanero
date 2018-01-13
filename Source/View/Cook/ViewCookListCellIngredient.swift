import UIKit

final class ViewCookListCellIngredient:ViewCookListCell
{
    private weak var labelText:UILabel!
    
    override func factoryViews()
    {
        super.factoryViews()
        
        let square:UIImageView = UIImageView()
        square.isUserInteractionEnabled = false
        square.translatesAutoresizingMaskIntoConstraints = false
        square.clipsToBounds = true
        square.contentMode = UIViewContentMode.center
        square.image = #imageLiteral(resourceName: "assetGenericSquare")
        
        let labelText:UILabel = UILabel()
        labelText.translatesAutoresizingMaskIntoConstraints = false
        labelText.isUserInteractionEnabled = false
        labelText.backgroundColor = UIColor.clear
        labelText.numberOfLines = 0
        self.labelText = labelText
        
        self.addSubview(square)
        self.addSubview(labelText)
        
        NSLayoutConstraint.topToTop(
            view:square,
            toView:self,
            constant:ViewCookList.Constants.marginHorizontal)
        NSLayoutConstraint.leftToLeft(
            view:square,
            toView:self,
            constant:ViewCookList.Constants.marginHorizontal)
        NSLayoutConstraint.size(
            view:square,
            constant:ViewCookListCellIngredient.Constants.squareSize)
        
        NSLayoutConstraint.topToTop(
            view:labelText,
            toView:self,
            constant:ViewCookList.Constants.marginHorizontal)
        NSLayoutConstraint.heightGreaterOrEqual(
            view:labelText)
        NSLayoutConstraint.leftToRight(
            view:labelText,
            toView:square,
            constant:ViewCookListCellIngredient.Constants.textLeft)
        NSLayoutConstraint.rightToRight(
            view:labelText,
            toView:self,
            constant:-ViewCookList.Constants.marginHorizontal)
    }
    
    override func config(model:CookItemProtocol)
    {
        super.config(model:model)
        
        guard
            
            let model:CookItemIngredient = model as? CookItemIngredient
            
        else
        {
            return
        }
        
        let ingredientText:NSAttributedString = ViewCookListCellIngredient.factoryIngredientText(model:model)
        self.labelText.attributedText = ingredientText
    }
    
    //MARK: private
    
    private class func factoryIngredientText(model:CookItemIngredient) -> NSAttributedString
    {
        let name:NSAttributedString = ViewCookListCellIngredient.factoryName(model:model)
        let amount:NSAttributedString = ViewCookListCellIngredient.factoryAmount(model:model)
        
        let text:NSMutableAttributedString = NSMutableAttributedString()
        text.append(name)
        text.appendNewLine()
        text.append(amount)
        
        return text
    }
    
    private class func factoryName(model:CookItemIngredient) -> NSAttributedString
    {
        let attributes:[NSAttributedStringKey:Any] = [
            NSAttributedStringKey.font:UIFont.bold(size:ViewCookListCellIngredient.Constants.nameFontSize),
            NSAttributedStringKey.foregroundColor:UIColor.colourBackgroundDark]
        
        let name:NSAttributedString = NSAttributedString(
            string:model.ingredient,
            attributes:attributes)
        
        return name
    }
    
    private class func factoryAmount(model:CookItemIngredient) -> NSAttributedString
    {
        let attributes:[NSAttributedStringKey:Any] = [
            NSAttributedStringKey.font:UIFont.regular(size:ViewCookListCellIngredient.Constants.amountFontSize),
            NSAttributedStringKey.foregroundColor:UIColor(white:0, alpha:0.5)]
        
        let amount:NSAttributedString = NSAttributedString(
            string:model.amount,
            attributes:attributes)
        
        return amount
    }
}
