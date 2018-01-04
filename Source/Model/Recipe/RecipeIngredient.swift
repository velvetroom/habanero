import Foundation

class RecipeIngredient:CloudItemProtocol
{
    let identifier:String
    let parentPath:String
    let ingredientIdentifier:String
    let ingredientName:String
    let amountType:IngredientAmountType
    
    required init?(
        identifier:String,
        parentPath:String,
        json:[String:Any])
    {
        guard
            
            let rawAmountType:Int16 = json[RecipeIngredient.Keys.amountType] as? Int16,
            let amountType:IngredientAmountType = IngredientAmountType(rawValue:rawAmountType),
            let ingredientIdentifier:String = json[RecipeIngredient.Keys.ingredientIdentifier] as? String,
            let ingredientName:String = json[RecipeIngredient.Keys.ingredientName] as? String
            
        else
        {
            return nil
        }
        
        self.parentPath = parentPath
        self.identifier = identifier
        self.amountType = amountType
        self.ingredientIdentifier = ingredientIdentifier
        self.ingredientName = ingredientName
    }
}
