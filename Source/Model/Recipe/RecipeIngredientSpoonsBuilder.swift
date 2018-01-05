import Foundation

struct RecipeIngredientSpoonsBuilder:CloudItemBuilderProtocol
{
    var spoons:Int
    
    var json:[String:Any]
    {
        get
        {
            let json:[String:Any] = [
                RecipeIngredient.Keys.spoons : self.spoons]
            
            return json
        }
    }
    
    init()
    {
        self.spoons = 0
    }
}
