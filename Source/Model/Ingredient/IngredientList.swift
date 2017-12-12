import Foundation

final class IngredientList:CloudListProtocol
{
    let identifier:String = IngredientList.identifier
    let parent:CloudProtocol?
    
    var json:[String:Any]
    {
        get
        {
            return [:]
        }
    }
    
    init?(
        parent:CloudProtocol?,
        json:[String:Any])
    {
        self.parent = nil
    }
}
