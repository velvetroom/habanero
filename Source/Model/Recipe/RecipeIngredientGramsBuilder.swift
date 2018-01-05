import Foundation

struct RecipeIngredientGramsBuilder:CloudItemBuilderProtocol
{
    var amountType:IngredientAmountType
    var ingredientIdentifier:String
    var ingredientName:String
    var grams:Int
    
    var json:[String:Any]
    {
        get
        {
            let json:[String:Any] = [
                RecipeIngredient.Keys.grams : self.grams,
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
        self.grams = 0
    }
}
