import Foundation

struct NewAddIngredientAmountTypeQuantity:NewAddIngredientAmountTypeProtocol
{
    let name:String = String.localizedModel(key:"NewAddIngredientAmountTypeQuantity_name")
    
    func createIngredient(
        amount:Float,
        database:Database,
        completion:@escaping((BuildIngredient) -> ()))
    {
        
    }
}
