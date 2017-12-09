import UIKit

class ViewNewAddListCell:ViewCollectionCell
{
    private(set) weak var controller:ControllerNewAdd?
    
    override init(frame:CGRect)
    {
        super.init(frame:frame)
        self.backgroundColor = UIColor.white
        
        self.factoryViews()
    }
    
    required init?(coder:NSCoder)
    {
        return nil
    }
    
    //MARK: internal
    
    func factoryViews() { }
    
    func config(
        controller:ControllerNewAdd,
        model:NewAddSectionItemProtocol)
    {
        self.controller = controller
    }
}
