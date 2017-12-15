import Foundation

protocol NewAddIngredientAmountTypeProtocol
{
    var name:String { get }
    
    func createIngredient(
        ingredient:Ingredient,
        database:Database,
        completion:@escaping((BuildIngredient) -> ()))
}
