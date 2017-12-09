import UIKit

final class ViewNewListCell:ViewCollectionCell
{
    override func factoryViews()
    {
        super.factoryViews()
        
        self.backgroundColor = UIColor.white
    }
    
    override func showReleased()
    {
        super.showReleased()
    }
    
    override func showHighlighted()
    {
        super.showHighlighted()
    }
    
    //MARK: internal
    
    func config(model:NewItem)
    {
        self.showState()
    }
}
