import Foundation

struct IngredientBuilder:CloudItemBuilderProtocol
{
    var name:String
    
    var json:[String:Any]
    {
        get
        {
            let json:[String:Any] = [
                Ingredient.Keys.name : self.name]
            
            return json
        }
    }
    
    init()
    {
        self.name = String()
    }
}
