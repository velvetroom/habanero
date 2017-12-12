import Foundation

final class Ingredient:CloudItemProtocol
{
    let parent:CloudProtocol
    let identifier:String
    let name:String
    
    var json:[String:Any]
    {
        get
        {
            let json:[String:Any] = Ingredient.factoryJson(ingredient:self)
            
            return json
        }
    }
    
    init?(
        parent:CloudProtocol,
        identifier:String,
        json:[String:Any])
    {
        guard
            
            let jsonMap:[String:Any] = json as? [String:Any],
            let name:String = jsonMap[Ingredient.Keys.name] as? String
        
        else
        {
            return nil
        }
        
        self.name = name
        self.parent = parent
        self.identifier = identifier
    }
}
