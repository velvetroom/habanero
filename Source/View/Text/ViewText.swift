import UIKit

final class ViewText:ViewMain<ArchText>
{
    required init(controller:ControllerText)
    {
        super.init(controller:controller)
    }
    
    required init?(coder:NSCoder)
    {
        return nil
    }
}
