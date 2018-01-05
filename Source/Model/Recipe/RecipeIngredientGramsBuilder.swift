import Foundation

struct RecipeIngredientGramsBuilder:CloudItemBuilderProtocol
{
    var grams:Int
    
    var json:[String:Any]
    {
        get
        {
            let json:[String:Any] = [
                RecipeIngredient.Keys.grams : self.grams]
            
            return json
        }
    }
    
    init()
    {
        self.grams = 0
    }
}
