import Foundation

extension ControllerNewAdd
{
    //MARK: internal
    
    func addStepImage()
    {
    }
    
    func addStepText()
    {
        let defaultText:String = String.localizedController(key:"ControllerNewAdd_defaultStepText")
        
        let controller:ControllerText = ControllerText(text:defaultText)
        { [weak self] (stepText:String) in
            
            self?.model.createTextStep(text:stepText)
            { [weak self] in
                
                self?.loadModel()
            }
        }
        
        self.parentController?.push(
            controller:controller,
            vertical:ControllerTransition.Vertical.bottom)
    }
}
