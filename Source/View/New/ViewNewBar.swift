import UIKit

final class ViewNewBar:View<ArchNew>
{
    required init(controller:ControllerNew)
    {
        super.init(controller:controller)
        isUserInteractionEnabled = false
        backgroundColor = UIColor.white
    }
    
    required init?(coder:NSCoder)
    {
        return nil
    }
}
