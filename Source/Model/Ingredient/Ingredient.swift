import Foundation

final class Ingredient:CloudItemProtocol, CloudSerialisableProtocol
{
    let parentPath:String
    let identifier:String
    let name:String
    
    var json:[String:Any]
    {
        get
        {
            let json:[String:Any] = Ingredient.factoryJson(item:self)
            
            return json
        }
    }
    
    init?(
        parentPath:String,
        identifier:String,
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
