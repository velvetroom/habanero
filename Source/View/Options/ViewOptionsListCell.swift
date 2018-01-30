import UIKit

class ViewOptionsListCell:ViewCollectionCell
{
    private(set) weak var controller:ControllerOptions?
    
    override func factoryViews()
    {
        super.factoryViews()
        self.backgroundColor = UIColor.white
    }
    
    //MARK: internal
    
    func config(
        controller:ControllerOptions,
        item:OptionsItemProtocol)
    {
        self.controller = controller
    }
}
