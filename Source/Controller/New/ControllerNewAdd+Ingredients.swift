import Foundation

extension ControllerNewAdd
{
    //MARK: internal
    
    func removeIngredient(item:NewAddSectionItemIngredient)
    {
        
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
