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
        let actionCancel:UIAlertAction = UIAlertAction(
            title:String.localizedController(key:"ControllerNewAdd_alertDeleteIngredientCancel"),
            style:UIAlertActionStyle.cancel)
        
        let actionDelete:UIAlertAction = UIAlertAction(
            title:String.localizedController(key:"ControllerNewAdd_alertDeleteIngredientDelete"),
            style:UIAlertActionStyle.destructive)
        { [weak self] (action:UIAlertAction) in
            
            self?.confirmRemoveIngredient(item:item)
        }
        
        let actions:[UIAlertAction] = [
            actionDelete,
            actionCancel]
        
        self.showAlert(
            actions:actions,
            title:String.localizedController(key:"ControllerNewAdd_alertDeleteIngredientTitle"),
            message:item.name)
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
