import Foundation

protocol NewAddIngredientAmountTypeProtocol
{
    var name:String { get }
    
    func createIngredient(
        amount:Float,
        database:Database,
        completion:@escaping((BuildIngredient) -> ()))
}
