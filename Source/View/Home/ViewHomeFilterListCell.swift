import UIKit

class ViewHomeFilterListCell:ViewCollectionCell
{
    private(set) weak var controller:ControllerHome?
    
    //MARK: internal
    
    func config(
        controller:ControllerHome,
        model:HomeFilterOptionsProtocol)
    {
        self.controller = controller
    }
}
