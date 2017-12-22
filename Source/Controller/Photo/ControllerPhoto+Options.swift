import UIKit

extension ControllerPhoto
{
    //MARK: internal
    
    func optionCancel()
    {
        self.parentController?.dismissAnimateOver(completion:nil)
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
