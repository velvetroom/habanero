import UIKit

class ViewNewAddListCell:UICollectionViewCell
{
    private(set) weak var controller:ControllerNewAdd?
    private(set) var model:NewAddSectionItemProtocol?
    
    override init(frame:CGRect)
    {
        super.init(frame:frame)
        self.clipsToBounds = true
        self.backgroundColor = UIColor.white
        
        self.factoryViews()
    }
    
    required init?(coder:NSCoder)
    {
        return nil
    }
    
    //MARK: internal
    
    func config(
        controller:ControllerNewAdd,
        model:NewAddSectionItemProtocol)
    {
        self.controller = controller
        self.model = model
    }
    
    func factoryViews() { }
}
