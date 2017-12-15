import Foundation

struct NewAddIngredientAmountTypeSpoons:NewAddIngredientAmountTypeProtocol
{
    let name:String = String.localizedModel(key:"NewAddIngredientAmountTypeSpoons_name")
    
    func createIngredient(
        amount:Float,
        database:Database,
        completion:@escaping((BuildIngredient) -> ()))
    {
        
    }
}
