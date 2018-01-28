import Foundation

protocol NewAddIngredientAmountTypeProtocol
{
    var name:String { get }
    
    func createIngredient(
        ingredientIdentifier:String,
        name:String,
        amount:String,
        build:Build,
        database:Database,
        completion:@escaping((BuildIngredient) -> ()))
}
