import UIKit

class ViewNewAddListFooter:UICollectionReusableView
{
    private(set) weak var controller:ControllerNewAdd?
    
    override init(frame:CGRect)
    {
        super.init(frame:frame)
        self.clipsToBounds = true
        self.backgroundColor = UIColor.clear
        
        self.factoryViews()
    }
    
    required init?(coder:NSCoder)
    {
        return nil
    }
    
    //MARK: internal
    
    func factoryViews() { }
    
    func config(controller:ControllerNewAdd)
    {
        self.controller = controller
    }
}
