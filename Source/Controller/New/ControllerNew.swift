import Foundation

final class ControllerNew:Controller<ArchNew>
{
    //MARK: internal
    
    func transitionToNewAdd()
    {
        let controller:ControllerNewAdd = ControllerNewAdd()
        
        self.parentController?.push(
            controller:controller,
            horizontal:ControllerTransition.Horizontal.right)
    }
}
