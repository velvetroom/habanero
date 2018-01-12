import Foundation

struct IngredientList:CloudListProtocol
{
    typealias Item = Ingredient
    
    var items:[Item]
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
