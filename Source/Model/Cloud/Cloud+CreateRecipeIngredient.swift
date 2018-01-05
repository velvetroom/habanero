import Foundation

extension Cloud
{
    private static var ingredientTypeRouter:[IngredientAmountType : ((BuildIngredient) -> ([String:Any]?))]
    {
        get
        {
            let map:[IngredientAmountType : ((BuildIngredient) -> ([String:Any]?))] = [
                IngredientAmountType.cups : Cloud.ingredientCups]
            
            return map
        }
    }
    
    //MARK: private
    
    private class func ingredientCups(ingredient:BuildIngredient) -> [String:Any]?
    {
        guard
        
            let ingredient:BuildIngredientCups = ingredient as? BuildIngredientCups
        
        else
        {
            return nil
        }
        
        var builder:RecipeIngredientCupsBuilder = RecipeIngredientCupsBuilder()
        builder.cups = ingredient.cups
        
        let json:[String:Any] = builder.json
        
        return json
    }
    
    //MARK: internal
    
    func createRecipeIngredient(
        ingredient:BuildIngredient,
        for recipe:Recipe,
        completion:@escaping((String?, Error?) -> ()))
    {
        guard
            
            let router:((BuildIngredient) -> ([String:Any]?)) =
                Cloud.ingredientTypeRouter[ingredient.ingredientAmountType],
            let json:[String:Any] = router(ingredient)
        
        else
        {
            return
        }
        
        self.provider.createItemAt(
            entity:recipe,
            with:json,
            completion:completion)
    }
}
