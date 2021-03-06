import Foundation

struct NewAddIngredientAmountTypeCups:NewAddIngredientAmountTypeProtocol
{
    let name:String = String.localizedModel(key:"NewAddIngredientAmountTypeCups_name")
    
    //MARK: private
    
    private static func amountToCups(amount:String) -> Float
    {
        guard
        
            let cups:Float = Float(amount)
        
        else
        {
            return NewAddIngredientAmountType.Constants.defaultCups
        }
        
        return cups
    }
    
    //MARK: internal
    
    func createIngredient(
        ingredientIdentifier:String,
        name:String,
        amount:String,
        build:Build,
        database:Database,
        completion:@escaping((BuildIngredient) -> ()))
    {
        let cups:Float = NewAddIngredientAmountTypeCups.amountToCups(amount:amount)
        
        database.createBuildIngredientCups(
            ingredientIdentifier:ingredientIdentifier,
            name:name,
            cups:cups,
            build:build,
            completion:completion)
    }
}
