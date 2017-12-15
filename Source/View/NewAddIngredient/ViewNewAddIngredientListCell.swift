import UIKit

final class ViewNewAddIngredientListCell:ViewCollectionCell
{
    override func factoryViews()
    {
        super.factoryViews()
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
        self.showState()
    }
}
