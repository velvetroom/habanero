import Foundation

struct RecipeIngredientSpoonsBuilder:CloudItemBuilderProtocol
{
    var ingredientIdentifier:String
    var ingredientName:String
    var spoons:Int
    
    var json:[String:Any]
    {
        get
        {
            let json:[String:Any] = [
                RecipeIngredient.Keys.amountType : IngredientAmountType.spoons,
                RecipeIngredient.Keys.spoons : self.spoons,
                RecipeIngredient.Keys.ingredientIdentifier : self.ingredientIdentifier,
                RecipeIngredient.Keys.ingredientName : self.ingredientName]
            
            return json
        }
    }
    
    init()
    {
        self.ingredientIdentifier = String()
        self.ingredientName = String()
        self.spoons = 0
    }
}
