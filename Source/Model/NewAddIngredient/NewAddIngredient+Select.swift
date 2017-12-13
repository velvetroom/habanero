import Foundation

extension NewAddIngredient
{
    private func asyncSelectIngredient(
        ingredient:Ingredient,
        completion:@escaping((Error?) -> ()))
    {
        let isAlreadyOnList:Bool = self.ingredientAlreadyOnList(ingredient:ingredient)
        
        if isAlreadyOnList
        {
            self.finishSelecting(
                error:NewAddIngredientError.ingredientAlreadyAdded,
                completion:completion)
        }
        else
        {
            self.createIngredient(
                ingredient:ingredient,
                completion:completion)
        }
    }
    
    private func ingredientAlreadyOnList(ingredient:Ingredient) -> Bool
    {
        guard
            
            let ingredientList:[BuildIngredient] = self.build?.ingredientList
            
        else
        {
            return false
        }
        
        for listedIngredient:BuildIngredient in ingredientList
        {
            if ingredient.identifier == listedIngredient.cloudId
            {
                return true
            }
        }
        
        return false
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
