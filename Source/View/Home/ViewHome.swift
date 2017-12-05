import UIKit

final class ViewHome:ViewMain<ArchHome>
{
    required init(controller:ControllerHome)
    {
        super.init(controller:controller)
    }
    
    required init?(coder:NSCoder)
    {
        return nil
    }
}
