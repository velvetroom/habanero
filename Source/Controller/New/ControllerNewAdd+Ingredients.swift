import Foundation

extension ControllerNewAdd
{
    //MARK: internal
    
    func removeIngredient(item:NewAddSectionItemIngredient)
    {
        self.viewMain.viewList.isUserInteractionEnabled = false
        
        self.model.removeIngredient(item:item)
        { [weak self] in
            
            self?.updateSections()
        }
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
