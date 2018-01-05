import Foundation

struct RecipeIngredientQuantityBuilder:CloudItemBuilderProtocol
{
    var amountType:IngredientAmountType
    var ingredientIdentifier:String
    var ingredientName:String
    var quantity:Float
    
    var json:[String:Any]
    {
        get
        {
            let json:[String:Any] = [
                RecipeIngredient.Keys.quantity : self.quantity,
                RecipeIngredient.Keys.amountType : self.amountType.rawValue,
                RecipeIngredient.Keys.ingredientIdentifier : self.ingredientIdentifier,
                RecipeIngredient.Keys.ingredientName : self.ingredientName]
            
            return json
        }
    }
    
    init()
    {
        self.amountType = IngredientAmountType.unknown
        self.ingredientIdentifier = String()
        self.ingredientName = String()
        self.quantity = 0
    }
}
