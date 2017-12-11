import Foundation
import FirebaseDatabase

extension Cloud
{
    //MARK: internal
    
    class func factoryItem<T:CloudItemProtocol>(
        snapshot:DataSnapshot,
        parent:CloudListProtocol,
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
    }
}
