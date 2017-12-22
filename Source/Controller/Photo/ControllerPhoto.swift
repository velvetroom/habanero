import UIKit

final class ControllerPhoto:Controller<ArchPhoto>, UIImagePickerControllerDelegate, UINavigationControllerDelegate
{
    init(completion:@escaping((UIImage?) -> ()))
    {
        super.init()
        
        self.model.completion = completion
    }
    
    required init?(coder:NSCoder)
    {
        return nil
    }
    
    //MARK: internal
    
    func selectedOption(option:PhotoOptionProtocol)
    {
        option.router(self)()
    }
    
    func transitionBack()
    {
        self.parentController?.dismissAnimateOver(completion:nil)
    }
    
    //MARK: picker delegate
    
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
