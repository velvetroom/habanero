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
            return []
        }
    }
    
    init?(
        parent:CloudProtocol,
        identifier:String,
        json:Any)
    {
        self.parent = parent
        self.identifier = identifier
    }
}
