import Foundation

final class RecipeIngredientMililitres:RecipeIngredient
{
    let mililitres:Int
    
    required init?(
        identifier:String,
        parentPath:String,
        json:[String:Any])
    {
        guard
            
            let mililitres:Int = json[RecipeIngredient.Keys.mililitres] as? Int
            
        else
        {
            return nil
        }
        
        self.mililitres = mililitres
        
        super.init(
            identifier:identifier,
            parentPath:parentPath,
            json:json)
    }
}
