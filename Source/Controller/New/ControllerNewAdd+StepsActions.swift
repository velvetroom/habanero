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
    
    private func confirmDeleteStep(step:BuildStep)
    {
        self.model.deleteStep(step:step)
        { [weak self] in
            
            self?.loadModel()
        }
    }
    
    private func deleteStep(step:BuildStep)
    {
        let actionCancel:UIAlertAction = UIAlertAction(
            title:String.localizedController(key:"ControllerNewAdd_alertDeleteStepCancel"),
            style:UIAlertActionStyle.cancel)
        
        let actionDelete:UIAlertAction = UIAlertAction(
            title:String.localizedController(key:"ControllerNewAdd_alertDeleteStepDelete"),
            style:UIAlertActionStyle.destructive)
        { [weak self] (action:UIAlertAction) in
            
            self?.confirmDeleteStep(step:step)
        }
        
        let actions:[UIAlertAction] = [
            actionDelete,
            actionCancel]
        
        self.showAlert(
            actions:actions,
            title:String.localizedController(key:"ControllerNewAdd_alertDeleteStepTitle"))
    }
    
    private func stepEditText(step:BuildStepText)
    {
        guard
            
            let currentText:String = step.text
        
        else
        {
            return
        }
        
        let controller:ControllerText = ControllerText(text:currentText)
        { [weak self] (updatedText:String) in
            
            self?.model.update(
                step:step,
                text:updatedText)
            {
                self?.loadModel()
            }
        }
        
        self.parentController?.push(
            controller:controller,
            vertical:ControllerTransition.Vertical.bottom)
    }
    
    private func stepEditText(step:BuildStepImage)
    {
        guard
            
            let currentText:String = step.text
            
        else
        {
            return
        }
        
        let controller:ControllerText = ControllerText(text:currentText)
        { [weak self] (updatedText:String) in
            
            self?.model.update(
                step:step,
                text:updatedText)
            {
                self?.loadModel()
            }
        }
        
        self.parentController?.push(
            controller:controller,
            vertical:ControllerTransition.Vertical.bottom)
    }
    
    private func stepEditImage(step:BuildStepImage)
    {
        let controller:ControllerPhoto = ControllerPhoto
        { [weak self] (image:UIImage?) in
            
            guard
            
                let image:UIImage = image
            
            else
            {
                return
            }
            
            self?.model.update(
                step:step,
                image:image)
            { [weak self] in
                
                self?.loadModel()
            }
        }
        
        self.parentController?.animateOver(controller:controller)
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
        
        for action:UIAlertAction in actions
        {
            alert.addAction(action)
        }
        
        alert.addAction(actionDelete)
        alert.addAction(actionCancel)
        
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
            
            self?.stepEditText(step:step)
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
            
            self?.stepEditText(step:step)
        }
        
        let actionEditImage:UIAlertAction = UIAlertAction(
            title:String.localizedController(key:"ControllerNewAdd_stepImageActionEditImage"),
            style:UIAlertActionStyle.default)
        { [weak self] (action:UIAlertAction) in
            
            self?.stepEditImage(step:step)
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
