import Foundation

struct RecipeIngredientSpoonsBuilder:CloudItemBuilderProtocol
{
    var amountType:IngredientAmountType
    var ingredientIdentifier:String
    var ingredientName:String
    var spoons:Int
    
    var json:[String:Any]
    {
        get
        {
            let json:[String:Any] = [
                RecipeIngredient.Keys.spoons : self.spoons,
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
        self.spoons = 0
    }
}
