import UIKit

final class ViewNew:ViewMain<ArchNew>
{
    required init(controller:ControllerNew)
    {
        super.init(controller:controller)
        backgroundColor = UIColor.colourBackgroundGray
    }
    
    required init?(coder:NSCoder)
    {
        return nil
    }
}
