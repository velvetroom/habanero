import UIKit

extension ControllerPhoto
{
    //MARK: internal
    
    func optionCancel()
    {
        self.transitionBack()
    }
    
    func optionCamera()
    {
        let controller:UIImagePickerController = UIImagePickerController()
        self.parentController?.present(
            controller,
            animated:true,
            completion:nil)
    }
    
    func optionLibrary()
    {
        
    }
}
