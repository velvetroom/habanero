import UIKit

final class ControllerNewAdd:Controller<ArchNewAdd>
{
    //MARK: internal
    
    func transitionBack()
    {
        self.parentController?.pop(horizontal:ControllerTransition.Horizontal.right)
    }
}
