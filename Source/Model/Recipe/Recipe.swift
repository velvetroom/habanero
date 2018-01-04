import Foundation

final class Recipe:CloudItemProtocol
{
    let identifier:String
    let parentPath:String
    let status:RecipeStatus
    
    init?(
        identifier:String,
        parentPath:String,
        json:[String:Any])
    {
        guard
            
            let name:String = json[Ingredient.Keys.name] as? String
            
            else
        {
            return nil
        }
        
        self.name = name
        self.parentPath = parentPath
        self.identifier = identifier
    }
}
