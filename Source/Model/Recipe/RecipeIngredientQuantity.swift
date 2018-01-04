import Foundation

final class RecipeIngredientQuantity:RecipeIngredient
{
    let quantity:Float
    
    required init?(
        identifier:String,
        parentPath:String,
        json:[String:Any])
    {
        guard
            
            let quantity:Float = json[RecipeIngredient.Keys.quantity] as? Float
            
        else
        {
            return nil
        }
        
        self.quantity = quantity
        
        super.init(
            identifier:identifier,
            parentPath:parentPath,
            json:json)
    }
}
