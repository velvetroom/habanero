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
                error:NewAddIngredientError.ingredientAlreadyAdded,
                completion:completion)
            
            return
        }
        
        self.createIngredient(
            ingredient:ingredient,
            completion:completion)
    }
    
    private func createIngredient(
        ingredient:Ingredient,
        completion:@escaping((Error?) -> ()))
    {
        self.database?.create
        { [weak self] (buildIngredient:BuildIngredient) in
            
            buildIngredient.cloudId = ingredient.identifier
            buildIngredient.name = ingredient.name
            buildIngredient.build = self?.build
            
            self?.ingredientCreated(completion:completion)
        }
    }
    
    private func ingredientCreated(completion:@escaping((Error?) -> ()))
    {
        database?.save
        { [weak self] in
            
            self?.finishSelecting(
                error:nil,
                completion:completion)
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
