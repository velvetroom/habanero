import UIKit

extension ControllerPhoto
{
    //MARK: private
    
    private func presentPicker(with sourceType:UIImagePickerControllerSourceType)
    {
        let controller:UIImagePickerController = UIImagePickerController()
        controller.sourceType = sourceType
        controller.allowsEditing = false
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
        self.presentPicker(width:UIImagePickerControllerSourceType.camera)
    }
    
    func optionLibrary()
    {
        self.presentPicker(width:UIImagePickerControllerSourceType.photoLibrary)
    }
}
