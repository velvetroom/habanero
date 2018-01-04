import Foundation

final class RecipeIngredientGrams:RecipeIngredient
{
    let grams:Int
    
    required init?(
        identifier:String,
        parentPath:String,
        json:[String:Any])
    {
        guard
            
            let grams:Int = json[RecipeIngredient.Keys.grams] as? Int
            
        else
        {
            return nil
        }
        
        self.grams = grams
        
        super.init(
            identifier:identifier,
            parentPath:parentPath,
            json:json)
    }
}
