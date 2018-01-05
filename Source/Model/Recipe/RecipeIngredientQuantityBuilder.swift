import Foundation

struct RecipeIngredientQuantityBuilder:CloudItemBuilderProtocol
{
    var quantity:Float
    
    var json:[String:Any]
    {
        get
        {
            let json:[String:Any] = [
                RecipeIngredient.Keys.quantity : self.quantity]
            
            return json
        }
    }
    
    init()
    {
        self.quantity = 0
    }
}
