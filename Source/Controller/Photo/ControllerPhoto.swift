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
    
    //MARK: private
    
    private func transitionToEditPhoto(
        image:UIImage,
        currentIndex:Int)
    {
        let controller:ControllerPhotoCrop = ControllerPhotoCrop(image:image)
        
        self.parentController?.push(
            controller:controller,
            vertical:ControllerTransition.Vertical.top)
        { [weak self] in
            
            self?.parentController?.popSilent(removeIndex:currentIndex)
        }
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
        picker.dismiss(animated:true)
        { [weak self] in
            
            self?.transitionBack()
        }
    }
    
    func imagePickerController(
        _ picker:UIImagePickerController,
        didFinishPickingMediaWithInfo info:[String:Any])
    {
        guard
            
            let image:UIImage = info[UIImagePickerControllerOriginalImage] as? UIImage,
            let currentIndex:Int = self.parentController?.childViewControllers.count
        
        else
        {
            self.transitionBack()
            
            return
        }
        
        picker.dismiss(animated:true)
        { [weak self] in
            
            self?.transitionToEditPhoto(
                image:image,
                currentIndex:currentIndex)
        }
    }
}
