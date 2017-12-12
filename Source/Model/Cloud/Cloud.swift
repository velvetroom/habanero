import Foundation
import Firebase

final class Cloud
{
    private let reference:Firestore
    
    init()
    {
        self.reference = Firestore.firestore()
    }
    
    //MARK: private
    
    private func createFailed(
        document:DocumentReference,
        completion:@escaping((String?, Error?) -> ()))
    {
        document.delete
        { (error:Error?) in
            
            completion(
                nil,
                CloudError.createFailed)
        }
    }
    
    private func loadFailed<T:CloudItemProtocol>(completion:((T?, Error?) -> ()))
    {
        
    }
    
    //MARK: internal
    
    func create(
        parentPath:String,
        data:[String:Any],
        completion:@escaping((String?, Error?) -> ()))
    {
        let document:DocumentReference = self.reference.collection(parentPath).document()
        document.setData(data)
        { [weak self] (error:Error?) in
            
            guard
            
                error == nil
            
            else
            {
                self?.createFailed(
                    document:document,
                    completion:completion)
                
                return
            }
            
            completion(
                document.documentID,
                nil)
        }
    }
    
    func loadItem<T:CloudItemProtocol>(
        parentPath:String,
        identifier:String,
        completion:@escaping((T?, Error?) -> ()))
    {
        let path:String = Cloud.factoryPath(
            parentPath:parentPath,
            identifier:identifier)
        
        let itemReference:DocumentReference = self.reference.collection(parentPath).document(identifier)
        
        itemReference.getDocument
        { (snapshot:DocumentSnapshot?, error:Error?) in
            
            let model:T? = Cloud.factoryItem(
                snapshot:snapshot,
                parent:parent,
                identifier:identifier)
            
            completion(model)
        }
    }
    
    /*
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
    
    
    
    func update(item:CloudProtocol)
    {
        let itemReference:DatabaseReference = self.reference.child(item.path)
        itemReference.setValue(item.json)
    }
    
    func remove(item:CloudProtocol)
    {
        let itemReference:DatabaseReference = self.reference.child(item.path)
        itemReference.removeValue()
    }*/
}
