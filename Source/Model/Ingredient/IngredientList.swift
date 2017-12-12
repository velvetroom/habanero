import Foundation

struct IngredientList:CloudListProtocol
{
    typealias Item = Ingredient
    
    var items:[Ingredient] = []
}
