import Foundation
import Firebase

final class Cloud
{
    let reference:Firestore
    
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
    
    /*
    
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
