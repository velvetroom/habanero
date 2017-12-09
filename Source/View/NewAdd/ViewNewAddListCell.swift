import UIKit

class ViewNewAddListCell:ViewCollectionCell
{
    private(set) weak var controller:ControllerNewAdd?
    
    override func factoryViews()
    {
        super.factoryViews()
        
        self.backgroundColor = UIColor.white
    }
    
    //MARK: internal
    
    func config(
        controller:ControllerNewAdd,
        model:NewAddSectionItemProtocol)
    {
        self.controller = controller
    }
}
