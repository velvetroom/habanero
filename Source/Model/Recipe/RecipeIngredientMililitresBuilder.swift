import Foundation

struct RecipeIngredientMililitresBuilder:CloudItemBuilderProtocol
{
    var ingredientIdentifier:String
    var ingredientName:String
    var mililitres:Int
    
    var json:[String:Any]
    {
        get
        {
            let json:[String:Any] = [
                RecipeIngredient.Keys.amountType : IngredientAmountType.mililitres.rawValue,
                RecipeIngredient.Keys.mililitres : self.mililitres,
                RecipeIngredient.Keys.ingredientIdentifier : self.ingredientIdentifier,
                RecipeIngredient.Keys.ingredientName : self.ingredientName]
            
            return json
        }
    }
    
    init()
    {
        self.ingredientIdentifier = String()
        self.ingredientName = String()
        self.mililitres = 0
    }
}
