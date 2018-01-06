import Foundation

struct RecipeIngredientGramsBuilder:CloudItemBuilderProtocol
{
    var ingredientIdentifier:String
    var ingredientName:String
    var grams:Int
    
    var json:[String:Any]
    {
        get
        {
            let json:[String:Any] = [
                RecipeIngredient.Keys.amountType : IngredientAmountType.grams,
                RecipeIngredient.Keys.grams : self.grams,
                RecipeIngredient.Keys.ingredientIdentifier : self.ingredientIdentifier,
                RecipeIngredient.Keys.ingredientName : self.ingredientName]
            
            return json
        }
    }
    
    init()
    {
        self.ingredientIdentifier = String()
        self.ingredientName = String()
        self.grams = 0
    }
}
