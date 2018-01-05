import Foundation

extension NewAdd
{
    //MARK: private
    
    private func saveIngredients(
        ingredients:[BuildIngredient],
        for recipeIdentifier:String,
        completion:@escaping((Error?) -> ()))
    {
        var ingredients:[BuildIngredient] = ingredients
        
        guard
        
            let ingredient:BuildIngredient = ingredients.popLast()
        
        else
        {
            self.saveSteps(
                recipeIdentifier:recipeIdentifier,
                completion:completion)
            
            return
        }
        
        self.cloud.createRecipeIngredient(
            buildIngredient:ingredient,
            for:recipeIdentifier)
        { [weak self] (recipeIngredientIdentifier:String?, error:Error?) in
            
            guard
            
                error == nil,
                recipeIngredientIdentifier != nil
            
            else
            {
                completion(error)
                
                return
            }
            
            self?.saveIngredients(
                ingredients:ingredients,
                for:recipeIdentifier,
                completion:completion)
        }
    }
    
    //MARK: internal
    
    func saveIngredients(
        recipeIdentifier:String,
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
            for:recipeIdentifier,
            completion:completion)
    }
}
