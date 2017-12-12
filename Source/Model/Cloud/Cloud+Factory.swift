import Foundation
import Firebase

extension Cloud
{
    //MARK: internal
    
    class func factoryPath(
        parentPath:String,
        identifier:String) -> String
    {
        var path:String = parentPath
        path.append("/")
        path.append(identifier)
        
        return path
    }
}
