import Foundation

struct RecipeIngredientCupsBuilder:CloudItemBuilderProtocol
{
    var cups:Float
    
    var json:[String:Any]
    {
        get
        {
            let json:[String:Any] = [
                RecipeIngredient.Keys.cups : self.cups]
            
            return json
        }
    }
    
    init()
    {
        self.cups = 0
    }
}
