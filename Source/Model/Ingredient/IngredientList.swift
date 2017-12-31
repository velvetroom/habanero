import Foundation

struct IngredientList:CloudListProtocol, CloudTopLevelProtocol
{
    typealias Item = Ingredient
    
    var items:[Ingredient] = []
}
