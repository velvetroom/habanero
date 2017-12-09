import UIKit

class ViewNewAddListFooter:ViewCollectionReusable
{
    private(set) weak var controller:ControllerNewAdd?
    
    func config(controller:ControllerNewAdd)
    {
        self.controller = controller
    }
}
