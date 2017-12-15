import UIKit

final class ViewNewAddIngredientAmountListCell:ViewCollectionCell
{
    private weak var labelName:UILabel!
    
    override func factoryViews()
    {
        super.factoryViews()
        
        let labelName:UILabel = UILabel()
        labelName.translatesAutoresizingMaskIntoConstraints = false
        labelName.backgroundColor = UIColor.clear
        labelName.isUserInteractionEnabled = false
        labelName.font = UIFont.regular(size:ViewNewAddIngredientAmountListCell.Constants.nameFontSize)
        self.labelName = labelName
        
        self.addSubview(labelName)
        
        NSLayoutConstraint.equalsVertical(
            view:labelName,
            toView:self)
        NSLayoutConstraint.leftToLeft(
            view:labelName,
            toView:self,
            constant:ViewNewAddIngredientAmountListCell.Constants.nameLeft)
        NSLayoutConstraint.widthGreaterOrEqual(
            view:labelName)
    }
    
    override func showReleased()
    {
        self.backgroundColor = UIColor.white
        self.labelName.textColor = UIColor(white:0, alpha:0.5)
    }
    
    override func showHighlighted()
    {
        self.backgroundColor = UIColor.colourSuccess
        self.labelName.textColor = UIColor.white
    }
    
    //MARK: internal
    
    func config(model:NewAddIngredientAmountTypeProtocol)
    {
        self.labelName.text = model.name
        
        self.showState()
    }
}
