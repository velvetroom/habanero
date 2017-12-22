import UIKit

extension ControllerPhoto:UIImagePickerControllerDelegate, UINavigationControllerDelegate
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
