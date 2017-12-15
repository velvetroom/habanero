import Foundation

protocol NewAddIngredientAmountTypeProtocol
{
    var name:String { get }
    
    func createIngredient(
        amount:String,
        database:Database,
        completion:@escaping((BuildIngredient) -> ()))
}
