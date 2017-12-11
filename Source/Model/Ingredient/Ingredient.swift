import Foundation

final class Ingredient:CloudItemProtocol
{
    let parent:CloudProtocol
    let identifier:String
    let name:String
    
    var json:Any
    {
        get
        {
            let json:Any = Ingredient.factoryJson(ingredient:self)
            
            return json
        }
    }
    
    init?(
        parent:CloudProtocol,
        identifier:String,
        json:Any)
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
