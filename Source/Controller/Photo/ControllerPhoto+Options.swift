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
        controller.delegate = self
        
        self.parentController?.present(
            controller,
            animated:true,
            completion:nil)
    }
    
    func optionLibrary()
    {
        
    }
}
