import UIKit

final class ViewNewAddIngredientListCell:ViewCollectionCell
{
    private weak var label:UILabel!
    
    override func factoryViews()
    {
        super.factoryViews()
        
        let label:UILabel = UILabel()
        label.isUserInteractionEnabled = false
        label.translatesAutoresizingMaskIntoConstraints = false
        label.backgroundColor = UIColor.clear
        label.font = UIFont.regular(size:ViewNewAddIngredientListCell.Constants.fontSize)
        label.textColor = UIColor.colourBackgroundDark
        label.numberOfLines = 0
        self.label = label
        
        self.addSubview(label)
        
        NSLayoutConstraint.equalsVertical(
            view:label,
            toView:self)
        NSLayoutConstraint.equalsHorizontal(
            view:label,
            toView:self,
            margin:ViewNewAddIngredientListCell.Constants.marginHorizontal)
    }
    
    override func showReleased()
    {
        super.showReleased()
        
        self.backgroundColor = UIColor.white
    }
    
    override func showHighlighted()
    {
        super.showHighlighted()
        
        self.backgroundColor = UIColor.colourSuccess.withAlphaComponent(0.4)
    }
    
    //MARK: internal
    
    func config(model:Ingredient)
    {
        self.label.text = model.name.capitalized
        self.showState()
    }
}
