import Foundation

extension NewAdd
{
    //MARK: private
    
    private func asyncRemoveIngredient(
        item:NewAddSectionItemIngredient,
        completion:@escaping(() -> ()))
    {
        guard
        
            let ingredient:BuildIngredient = item.ingredient,
            let database:Database = self.database
        
        else
        {
            return
        }
        
        ingredient.build = nil
        
        database.delete(data:ingredient)
        {
            database.save
            { [weak self] in
                
                self?.ingredientRemoved(completion:completion)
            }
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
