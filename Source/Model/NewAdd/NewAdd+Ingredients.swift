import Foundation

extension NewAdd
{
    //MARK: private
    
    private func asyncRemoveIngredient(
        item:NewAddSectionItemIngredient,
        completion:@escaping(() -> ()))
    {
        guard
        
            let ingredient:BuildIngredient = item.ingredient
        
        else
        {
            return
        }
        
        self.database.deleteBuildIngredient(buildIngredient:ingredient)
        { [weak self] in
            
            self?.ingredientRemoved(completion:completion)
        }
    }
    
    private func ingredientRemoved(completion:@escaping(() -> ()))
    {
        DispatchQueue.main.async
        {
            completion()
        }
    }
    
    //MARK: internal
    
    func removeIngredient(
        item:NewAddSectionItemIngredient,
        completion:@escaping(() -> ()))
    {
        DispatchQueue.global(qos:DispatchQoS.QoSClass.background).async
        { [weak self] in
            
            self?.asyncRemoveIngredient(
                item:item,
                completion:completion)
        }
    }
}
