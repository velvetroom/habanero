import UIKit

class ViewCookListCell:ViewCollectionCell
{
    override func factoryViews()
    {
        super.factoryViews()
        self.isUserInteractionEnabled = false
    }
    
    //MARK: internal
    
    func config(model:CookItemProtocol) { }
}
