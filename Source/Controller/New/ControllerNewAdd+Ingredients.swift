import UIKit

extension ControllerNewAdd
{
    //MARK: private
    
    private func confirmRemoveIngredient(item:NewAddSectionItemIngredient)
    {
        self.model.removeIngredient(item:item)
        { [weak self] in
            
            self?.loadModel()
        }
    }
    
    //MARK: internal
    
    func removeIngredient(item:NewAddSectionItemIngredient)
    {
        let alert:UIAlertController = UIAlertController(
            title:String.localizedController(key:"ControllerNewAdd_alertDeleteIngredientTitle"),
            message:item.name,
            preferredStyle:UIAlertControllerStyle.actionSheet)
        
        let actionCancel:UIAlertAction = UIAlertAction(
            title:String.localizedController(key:"ControllerNewAdd_alertDeleteIngredientCancel"),
            style:UIAlertActionStyle.cancel)
        
        let actionDelete:UIAlertAction = UIAlertAction(
            title:String.localizedController(key:"ControllerNewAdd_alertDeleteIngredientDelete"),
            style:UIAlertActionStyle.destructive)
        { [weak self] (action:UIAlertAction) in
            
            self?.confirmRemoveIngredient(item:item)
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
    
    func transitionAddIngredient()
    {
        guard
        
            let build:Build = self.model.build,
            let database:Database = self.model.database
        
        else
        {
            return
        }
        
        let controller:ControllerNewAddIngredient = ControllerNewAddIngredient(
            build:build,
            database:database)
        
        self.parentController?.push(
            controller:controller,
            horizontal:ControllerTransition.Horizontal.right)
    }
}
