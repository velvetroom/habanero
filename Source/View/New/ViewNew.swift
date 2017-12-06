import UIKit

final class ViewNew:ViewMain<ArchNew>
{
    weak var viewList:ViewNewList!
    
    required init(controller:ControllerNew)
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
