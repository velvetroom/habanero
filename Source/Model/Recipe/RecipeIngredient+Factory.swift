import Foundation

extension RecipeIngredient
{
    private static var ingredientTypeForAmount:[IngredientAmountType:RecipeIngredient.Type]
    {
        get
        {
            let map:[IngredientAmountType:RecipeIngredient.Type] = [
                IngredientAmountType.cups : RecipeIngredientCups.self,
                IngredientAmountType.grams : RecipeIngredientGrams.self,
                IngredientAmountType.mililitres : RecipeIngredientMililitres.self,
                IngredientAmountType.quantity : RecipeIngredientQuantity.self,
                IngredientAmountType.spoons : RecipeIngredientSpoons.self]
            
            return map
        }
    }
    
    //MARK: private
    
    private class func factoryIngredientType(json:[String:Any]) -> RecipeIngredient.Type?
    {
        guard
        
            let rawAmountType:Int16 = json[RecipeIngredient.Keys.amountType] as? Int16,
            let amountType:IngredientAmountType = IngredientAmountType(rawValue:rawAmountType)
        
        else
        {
            return nil
        }
        
        let ingredientType:RecipeIngredient.Type? = RecipeIngredient.ingredientTypeForAmount[amountType]
        
        return ingredientType
    }
    
    //MARK: internal
    
    class func factoryIngredients(
        json:Any,
        parentPath:String) -> [RecipeIngredient]
    {
        guard
        
            let ingredientsMap:[String:[String:Any]] = json as? [String:[String:Any]]
        
        else
        {
            return []
        }
        
        let ingredientKeys:[String] = Array(ingredientsMap.keys)
        var ingredients:[RecipeIngredient] = []
        
        for ingredientKey:String in ingredientKeys
        {
            guard
            
                let item:[String:Any] = ingredientsMap[ingredientKey],
                let ingredientType:RecipeIngredient.Type = RecipeIngredient.factoryIngredientType(json:item),
                let ingredient:RecipeIngredient = ingredientType.init(
                    identifier:ingredientKey,
                    parentPath:parentPath,
                    json:item)
            
            else
            {
                continue
            }
            
            ingredients.append(ingredient)
        }
        
        return ingredients
    }
}
