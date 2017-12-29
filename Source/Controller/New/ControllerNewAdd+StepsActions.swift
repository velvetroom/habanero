import UIKit

extension ControllerNewAdd
{
    private static var stepTypeRouter:[RecipeStepType : ((ControllerNewAdd) -> (BuildStep) -> ())]
    {
        get
        {
            let map:[RecipeStepType : ((ControllerNewAdd) -> (BuildStep) -> ())] = [
                RecipeStepType.text : ControllerNewAdd.showActionsForText,
                RecipeStepType.image : ControllerNewAdd.showActionsForImage]
            
            return map
        }
    }
    
    //MARK: private
    
    private func deleteStep(step:BuildStep)
    {
        
    }
    
    private func stepEditText(stepText:BuildStepText)
    {
        
    }
    
    private func stepEditText(stepImage:BuildStepImage)
    {
        
    }
    
    private func stepEditImage(stepImage:BuildStepImage)
    {
        
    }
    
    private func showActions(
        actions:[UIAlertAction],
        for step:BuildStep)
    {
        let alert:UIAlertController = UIAlertController(
            title:String.localizedController(key:"ControllerNewAdd_stepActionsTitle"),
            message:nil,
            preferredStyle:UIAlertControllerStyle.actionSheet)
        
        let actionCancel:UIAlertAction = UIAlertAction(
            title:String.localizedController(key:"ControllerNewAdd_stepActionCancel"),
            style:UIAlertActionStyle.cancel)
        
        let actionDelete:UIAlertAction = UIAlertAction(
            title:String.localizedController(key:"ControllerNewAdd_stepActionDelete"),
            style:UIAlertActionStyle.destructive)
        { [weak self] (action:UIAlertAction) in
            
            self?.deleteStep(step:step)
        }
        
        alert.addAction(actionCancel)
        alert.addAction(actionDelete)
        
        for action:UIAlertAction in actions
        {
            alert.addAction(action)
        }
        
        if let popover:UIPopoverPresentationController = alert.popoverPresentationController
        {
            popover.sourceView = self.view
            popover.permittedArrowDirections = UIPopoverArrowDirection.up
            popover.sourceRect = CGRect(
                x:self.view.center.x,
                y:0,
                width:1,
                height:1)
        }
        
        self.present(
            alert,
            animated:true,
            completion:nil)
    }
    
    private func showActionsForText(step:BuildStep)
    {
        guard
            
            let step:BuildStepText = step as? BuildStepText
        
        else
        {
            return
        }
        
        let actionEditText:UIAlertAction = UIAlertAction(
            title:String.localizedController(key:"ControllerNewAdd_stepTextActionEditText"),
            style:UIAlertActionStyle.default)
        { [weak self] (action:UIAlertAction) in
            
            self?.stepEditText(stepText:step)
        }
        
        let actions:[UIAlertAction] = [
            actionEditText]
        
        self.showActions(
            actions:actions,
            for:step)
    }
    
    private func showActionsForImage(step:BuildStep)
    {
        guard
        
            let step:BuildStepImage = step as? BuildStepImage
        
        else
        {
            return
        }
        
        let actionEditText:UIAlertAction = UIAlertAction(
            title:String.localizedController(key:"ControllerNewAdd_stepImageActionEditText"),
            style:UIAlertActionStyle.default)
        { [weak self] (action:UIAlertAction) in
            
            self?.stepEditText(stepImage:step)
        }
        
        let actionEditImage:UIAlertAction = UIAlertAction(
            title:String.localizedController(key:"ControllerNewAdd_stepImageActionEditImage"),
            style:UIAlertActionStyle.default)
        { [weak self] (action:UIAlertAction) in
            
            self?.stepEditImage(stepImage:step)
        }
        
        let actions:[UIAlertAction] = [
            actionEditText,
            actionEditImage]
        
        self.showActions(
            actions:actions,
            for:step)
    }
    
    //MARK: internal
    
    func showActionsForStep(step:BuildStep)
    {
        guard
        
            let router:((ControllerNewAdd) -> (BuildStep) -> ()) =
            ControllerNewAdd.stepTypeRouter[step.recipeStepType]
        
        else
        {
            return
        }
        
        router(self)(step)
    }
}
