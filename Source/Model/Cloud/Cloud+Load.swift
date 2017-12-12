import Foundation
import Firebase

extension Cloud
{
    //MARK: private
    
    private func loadItem<T:CloudProtocol>(
        snapshot:DocumentSnapshot?,
        parentPath:String,
        identifier:String,
        completion:((T?, Error?) -> ()))
    {
        guard
            
            let json:[String:Any] = snapshot?.data(),
            let model:T = T(
                parentPath:parentPath,
                identifier:identifier,
                json:json)
            
        else
        {
            completion(
                nil,
                CloudError.loadItemDataFailed)
            
            return
        }
        
        completion(
            model,
            nil)
    }
    
    //MARK: internal
    
    func loadItem<T:CloudProtocol>(
        parentPath:String,
        identifier:String,
        completion:@escaping((T?, Error?) -> ()))
    {
        let itemReference:DocumentReference = self.reference.collection(parentPath).document(identifier)
        
        itemReference.getDocument
        { [weak self] (snapshot:DocumentSnapshot?, error:Error?) in
            
            guard
                
                error == nil
                
            else
            {
                completion(
                    nil,
                    CloudError.loadItemFailed)
                
                return
            }
            
            self?.loadItem(
                snapshot:snapshot,
                parentPath:parentPath,
                identifier:identifier,
                completion:completion)
        }
    }
    
    func loadList<T:CloudListProtocol>(
        path:String,
        completion:@escaping((T?, Error?) -> ()))
    {
        let listReference:CollectionReference = self.reference.collection(path)
        
        listReference.getDocuments
        { (querySnapshot:QuerySnapshot?, error:Error?) in
            
            querySnapshot.docu
        }
    }
}
