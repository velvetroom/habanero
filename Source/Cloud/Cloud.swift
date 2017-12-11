import Foundation
import Firebase

final class Cloud
{
    private let reference:Firestore
    
    init()
    {
        self.reference = Firestore.firestore()
    }
    
    //MARK: internal
    
    func create(
        parent:CloudProtocol,
        data:[String:Any],
        completion:@escaping((String, Error?) -> ()))
    {
        let document:DocumentReference = self.reference.collection(parent.path).document()
        document.setData(data)
        { (error:Error?) in
            
            guard
            
                error == nil
            
            else
            {
                completion(document.documentID, error)
                
                return
            }
            
            completion(document.documentID, nil)
        }
    }
    
    func loadList<T:CloudListProtocol>(
        parent:CloudProtocol?,
        completion:@escaping((T?) -> ()))
    {
        let identifier:String = T.self.identifier
        let path:String
        
        if let childPath:String = parent?.factoryPath(identifier:identifier)
        {
            path = childPath
        }
        else
        {
            path = identifier
        }
        
        let itemReference:DatabaseReference = self.reference.child(path)
        itemReference.observeSingleEvent(of:DataEventType.value)
        { (snapshot:DataSnapshot) in
            
            let model:T? = Cloud.factoryList(
                snapshot:snapshot,
                parent:parent)
            
            completion(model)
        }
    }
    
    func loadItem<T:CloudItemProtocol>(
        parent:CloudProtocol,
        identifier:String,
        completion:@escaping((T?) -> ()))
    {
        let path:String = parent.factoryPath(identifier:identifier)
        
        let itemReference:DatabaseReference = self.reference.child(path)
        itemReference.observeSingleEvent(of:DataEventType.value)
        { (snapshot:DataSnapshot) in
            
            let model:T? = Cloud.factoryItem(
                snapshot:snapshot,
                parent:parent,
                identifier:identifier)
            
            completion(model)
        }
    }
    
    func update(item:CloudProtocol)
    {
        let itemReference:DatabaseReference = self.reference.child(item.path)
        itemReference.setValue(item.json)
    }
    
    func remove(item:CloudProtocol)
    {
        let itemReference:DatabaseReference = self.reference.child(item.path)
        itemReference.removeValue()
    }
}
