import Foundation

extension NewAddIngredient
{
    private func asyncSelectIngredient(
        ingredient:Ingredient,
        completion:@escaping((Error?) -> ()))
    {
        guard
            
            let ingredientList:[BuildIngredient] = self.build?.ingredientList
        
        else
        {
            return
        }
        
        for listedIngredient:BuildIngredient in ingredientList
        {
            guard
            
                ingredient.identifier == listedIngredient.cloudId
            
            else
            {
                continue
            }
            
            self.finishSelecting(
                error: <#T##Error?#>,
                completion:completion)
            
            break
        }
    }
    
    private func finishSelecting(
        error:Error?,
        completion:@escaping((Error?) -> ()))
    {
        DispatchQueue.main.async
        {
            completion(error)
        }
    }
    
    //MARK: internal
    
    func selectIngredient(
        ingredient:Ingredient,
        completion:@escaping((Error?) -> ()))
    {
        DispatchQueue.global(qos:DispatchQoS.QoSClass.background).async
        { [weak self] in
            
            self?.asyncSelectIngredient(
                ingredient:ingredient,
                completion:completion)
        }
    }
}
