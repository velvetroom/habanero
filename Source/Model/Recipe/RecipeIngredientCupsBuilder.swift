import Foundation

struct RecipeIngredientCupsBuilder:CloudItemBuilderProtocol
{
    var ingredientIdentifier:String
    var ingredientName:String
    var cups:Float
    
    var json:[String:Any]
    {
        get
        {
            let json:[String:Any] = [
                RecipeIngredient.Keys.amountType : IngredientAmountType.cups.rawValue,
                RecipeIngredient.Keys.cups : self.cups,
                RecipeIngredient.Keys.ingredientIdentifier : self.ingredientIdentifier,
                RecipeIngredient.Keys.ingredientName : self.ingredientName]
            
            return json
        }
    }
    
    init()
    {
        self.ingredientIdentifier = String()
        self.ingredientName = String()
        self.cups = 0
    }
}
