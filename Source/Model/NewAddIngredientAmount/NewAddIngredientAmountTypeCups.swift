import Foundation

struct NewAddIngredientAmountTypeCups:NewAddIngredientAmountTypeProtocol
{
    let name:String = String.localizedModel(key:"NewAddIngredientAmountTypeCups_name")
    
    func createIngredient(
        amount:Float,
        database:Database,
        completion:@escaping((BuildIngredient) -> ()))
    {
        
    }
}
