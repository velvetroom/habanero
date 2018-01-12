import Foundation

struct RecipeIngredientsList:CloudListProtocol
{
    typealias Item = RecipeIngredient
    
    var items:[Item]
    let parentPath:String
    
    init(parentPath:String)
    {
        self.items = []
        self.parentPath = parentPath
    }
}
