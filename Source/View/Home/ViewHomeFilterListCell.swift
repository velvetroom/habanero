import UIKit

class ViewHomeFilterListCell:ViewCollectionCell
{
    private(set) weak var controller:ControllerHome?
    
    //MARK: internal
    
    func config(controller:ControllerHome)
    {
        self.controller = controller
    }
}
