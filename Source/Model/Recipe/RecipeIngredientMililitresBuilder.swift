import Foundation

struct RecipeIngredientMililitresBuilder:CloudItemBuilderProtocol
{
    var mililitres:Int
    
    var json:[String:Any]
    {
        get
        {
            let json:[String:Any] = [
                RecipeIngredient.Keys.mililitres : self.mililitres]
            
            return json
        }
    }
    
    init()
    {
        self.mililitres = 0
    }
}
