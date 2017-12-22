import UIKit

extension ControllerPhoto
{
    //MARK: private
    
    private func presentPicker()
    {
        let controller:UIImagePickerController = UIImagePickerController()
        controller.delegate = self
        
        self.parentController?.present(
            controller,
            animated:true,
            completion:nil)
    }
    
    //MARK: internal
    
    func optionCancel()
    {
        self.transitionBack()
    }
    
    func optionCamera()
    {
        self.presentPicker()
    }
    
    func optionLibrary()
    {
        self.presentPicker()
    }
}
