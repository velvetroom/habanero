import Foundation

final class RecipeIngredientCups:RecipeIngredient
{
    let cups:Float
    
    required init?(
        identifier:String,
        parentPath:String,
        json:[String:Any])
    {
        guard
            
            let cups:Float = json[RecipeIngredient.Keys.cups] as? Float
        
        else
        {
            return nil
        }
        
        self.cups = cups
        
        super.init(
            identifier:identifier,
            parentPath:parentPath,
            json:json)
    }
}
