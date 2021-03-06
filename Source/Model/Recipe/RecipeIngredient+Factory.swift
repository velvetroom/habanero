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
    
    //MARK: internal
    
    class func factoryIngredientType(json:[String:Any]) -> RecipeIngredient.Type?
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
}
