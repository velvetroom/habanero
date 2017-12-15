import Foundation

struct NewAddIngredientAmountTypeSpoons:NewAddIngredientAmountTypeProtocol
{
    let name:String = String.localizedModel(key:"NewAddIngredientAmountTypeSpoons_name")
    
    func createIngredient(
        amount:String,
        database:Database,
        completion:@escaping((BuildIngredient) -> ()))
    {
        
    }
}
