import Foundation

struct RecipeStepsList:CloudListProtocol
{
    typealias Item = RecipeStep
    
    var items:[Item]
    let parentPath:String
    
    init(parentPath:String)
    {
        self.items = []
        self.parentPath = parentPath
    }
    
    static func factoryItem(
        identifier:String,
        parentPath:String,
        json:[String:Any]) -> Item?
    {
        guard
            
            let itemType:Item.Type = Item.factoryStepType(json:json)
            
        else
        {
            return nil
        }
        
        let item:Item? = itemType.init(
            identifier:identifier,
            parentPath:parentPath,
            json:json)
        
        return item
    }
}
