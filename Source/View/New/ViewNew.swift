import UIKit

final class ViewNew:ViewMain<ArchNew>
{
    weak var viewList:ViewNewList!
    
    required init(controller:ControllerNew)
    {
        super.init(controller:controller)
        backgroundColor = UIColor.colourBackgroundGray
        
        factoryViews()
    }
    
    required init?(coder:NSCoder)
    {
        return nil
    }
}
