import Foundation

struct NewAddIngredientAmountTypeGrams:NewAddIngredientAmountTypeProtocol
{
    let name:String = String.localizedModel(key:"NewAddIngredientAmountTypeGrams_name")
    
    func createIngredient(
        amount:Float,
        database:Database,
        completion:@escaping((BuildIngredient) -> ()))
    {
        
    }
}
