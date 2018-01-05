import Foundation

extension NewAdd
{
    //MARK: private
    
    private func saveIngredients(
        ingredients:[BuildIngredient],
        for recipe:Recipe,
        completion:@escaping((Error?) -> ()))
    {
        var ingredients:[BuildIngredient] = ingredients
        
        guard
        
            let ingredient:BuildIngredient = ingredients.popLast()
        
        else
        {
            self.saveSteps(
                recipe:recipe,
                completion:completion)
            
            return
        }
        
        self.cloud.createRecipeIngredient(
            ingredient:ingredient,
            for:recipe)
        { [weak self] (identifier:String?, error:Error?) in
            
            guard
            
                error == nil,
                identifier != nil
            
            else
            {
                completion(error)
                
                return
            }
            
            self?.saveIngredients(
                ingredients:ingredients,
                for:recipe,
                completion:completion)
        }
    }
    
    //MARK: internal
    
    func saveIngredients(
        recipe:Recipe,
        completion:@escaping((Error?) -> ()))
    {
        guard
        
            let ingredients:[BuildIngredient] = self.build?.ingredientList
        
        else
        {
            return
        }
        
        self.saveIngredients(
            ingredients:ingredients,
            for:recipe,
            completion:completion)
    }
}
