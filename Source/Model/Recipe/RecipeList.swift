import Foundation

struct RecipeList:CloudListProtocol
{
    typealias Item = Recipe
    
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
