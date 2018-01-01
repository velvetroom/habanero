import Foundation

struct IngredientList:CloudListProtocol
{
    typealias Item = Ingredient
    
    var items:[Ingredient]
    let parentPath:String
    
    init(parentPath:String)
    {
        self.items = []
        self.parentPath = parentPath
    }
    
    init()
    {
        self.init(parentPath:String())
    }
}
