import Foundation

final class Ingredient:CloudItemProtocol
{
    let parentPath:String
    let identifier:String
    let name:String
    
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
