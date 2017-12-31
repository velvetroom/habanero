import Foundation

struct IngredientList:CloudListProtocol, CloudListTopLevelProtocol
{
    typealias Item = Ingredient
    
    var items:[Ingredient] = []
}
