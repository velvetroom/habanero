import Foundation

struct RecipeStepTextBuilder:CloudItemBuilderProtocol
{
    var stepType:IngredientAmountType
    var ingredientIdentifier:String
    var ingredientName:String
    var cups:Float
    
    var json:[String:Any]
    {
        get
        {
            let json:[String:Any] = [
                RecipeIngredient.Keys.cups : self.cups,
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
        self.cups = 0
    }
}
