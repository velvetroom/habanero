import Foundation
import Firebase

extension Cloud
{
    //MARK: internal
    /*
    class func factoryList<T:CloudListProtocol>(
        snapshot:DataSnapshot,
        parent:CloudProtocol?) -> T?
    {
        guard
            
            let json:Any = snapshot.value,
            json is NSNull == false
            
        else
        {
            return nil
        }
        
        let model:T? = T(
            parent:parent,
            json:json)
        
        return model
    }
    
    class func factoryItem<T:CloudItemProtocol>(
        snapshot:DataSnapshot,
        parent:CloudProtocol,
        identifier:String) -> T?
    {
        guard
            
            let json:Any = snapshot.value,
            json is NSNull == false
            
        else
        {
            return nil
        }
        
        let model:T? = T(
            parent:parent,
            identifier:identifier,
            json:json)
        
        return model
    }*/
    
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
