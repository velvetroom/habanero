import Foundation

final class RecipeIngredientSpoons:RecipeIngredient
{
    let spoons:Int
    
    required init?(
        identifier:String,
        parentPath:String,
        json:[String:Any])
    {
        guard
            
            let spoons:Int = json[RecipeIngredient.Keys.spoons] as? Int
            
        else
        {
            return nil
        }
        
        self.spoons = spoons
        
        super.init(
            identifier:identifier,
            parentPath:parentPath,
            json:json)
    }
}
