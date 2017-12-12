import Foundation

final class IngredientList:CloudListProtocol
{
    let identifier:String = IngredientList.identifier
    let parentPath:String
    
    var json:[String:Any]
    {
        get
        {
            return [:]
        }
    }
    
    init?(
        parentPath:String,
        json:[String:Any])
    {
        self.parentPath = parentPath
    }
}
