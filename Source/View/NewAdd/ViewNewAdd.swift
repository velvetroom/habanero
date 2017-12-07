import UIKit

final class ViewNewAdd:ViewMain<ArchNewAdd>
{
    override var shouldPanBack:Bool
    {
        get
        {
            return true
        }
    }
    
    required init(controller:ControllerNewAdd)
    {
        super.init(controller:controller)
        self.backgroundColor = UIColor.colourBackgroundGray
        
        self.factoryViews()
    }
    
    required init?(coder:NSCoder)
    {
        return nil
    }
}
