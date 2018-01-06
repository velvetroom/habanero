import Foundation

struct RecipeIngredientQuantityBuilder:CloudItemBuilderProtocol
{
    var ingredientIdentifier:String
    var ingredientName:String
    var quantity:Float
    
    var json:[String:Any]
    {
        get
        {
            let json:[String:Any] = [
                RecipeIngredient.Keys.amountType : IngredientAmountType.quantity.rawValue,
                RecipeIngredient.Keys.quantity : self.quantity,
                RecipeIngredient.Keys.ingredientIdentifier : self.ingredientIdentifier,
                RecipeIngredient.Keys.ingredientName : self.ingredientName]
            
            return json
        }
    }
    
    init()
    {
        self.ingredientIdentifier = String()
        self.ingredientName = String()
        self.quantity = 0
    }
}
