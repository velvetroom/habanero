import UIKit

extension ControllerPhoto:UIImagePickerControllerDelegate
{
    func imagePickerControllerDidCancel(_ picker:UIImagePickerController)
    {
        self.transitionBack()
    }
    
    func imagePickerController(
        _ picker:UIImagePickerController,
        didFinishPickingMediaWithInfo info:[String : Any])
    {
    }
}
