import UIKit

extension ControllerNewAdd
{
    //MARK: private
    
    private func addStepImage(with image:UIImage)
    {
        let defaultText:String = String.localizedController(key:"ControllerNewAdd_defaultStepImage")
        
        let controller:ControllerText = ControllerText(text:defaultText)
        { [weak self] (stepText:String) in
            
            self?.model.createStepImage(
                image:image,
                text:stepText)
            { [weak self] in
                
                self?.loadModel()
            }
        }
        
        self.parentController?.push(
            controller:controller,
            vertical:ControllerTransition.Vertical.bottom)
    }
    
    //MARK: internal
    
    func addStepImage()
    {
        let controller:ControllerPhoto = ControllerPhoto
        { [weak self] (image:UIImage?) in
            
            guard
            
                let image:UIImage = image
            
            else
            {
                return
            }
            
            self?.addStepImage(with:image)
        }
        
        self.parentController?.animateOver(controller:controller)
    }
    
    func addStepText()
    {
        let defaultText:String = String.localizedController(key:"ControllerNewAdd_defaultStepText")
        
        let controller:ControllerText = ControllerText(text:defaultText)
        { [weak self] (stepText:String) in
            
            self?.model.createStepText(text:stepText)
            { [weak self] in
                
                self?.loadModel()
            }
        }
        
        self.parentController?.push(
            controller:controller,
            vertical:ControllerTransition.Vertical.bottom)
    }
    
    func moveStepFrom(
        origin:IndexPath,
        to destination:IndexPath)
    {
        self.model.moveStepFrom(
            origin:origin,
            to:destination)
        { [weak self] in
            
            self?.loadModel()
        }
    }
    
    func showActionsForStep(step:NewAddSectionItemStepProtocol)
    {
        
    }
}
