import UIKit

class ViewOptionsListCell:ViewCollectionCell
{
    private(set) weak var controller:ControllerOptions?
    
    //MARK: internal
    
    func config(
        controller:ControllerOptions,
        item:OptionsItemProtocol)
    {
        self.controller = controller
    }
}
