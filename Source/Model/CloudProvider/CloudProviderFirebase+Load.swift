import Foundation
import Firebase

extension CloudProviderFirebase
{
    //MARK: private
    
    private func loadDocument<T:CloudItemProtocol>(
        identifier:String,
        collectionPath:String,
        snapshot:DocumentSnapshot?,
        completion:((T?, Error?) -> ()))
    {
        guard
            
            let json:[String:Any] = snapshot?.data(),
            let model:T = T(
                identifier:identifier,
                parentPath:collectionPath,
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
    
    private func loadCollectionDocuments<T:CloudListProtocol>(
        collectionIdentifier:String,
        parentPath:String,
        querySnapshot:QuerySnapshot,
        completion:((T?, Error?) -> ()))
    {
        let collectionPath:String = parentPath.appendingPathComponent(component:collectionIdentifier)
        var collection:T = T(parentPath:parentPath)
        let documents:[DocumentSnapshot] = querySnapshot.documents
        
        for document:DocumentSnapshot in documents
        {
            let identifier:String = document.documentID
            let json:[String:Any] = document.data()
            
            guard
                
                let item:T.Item = T.Item(
                    identifier:identifier,
                    parentPath:collectionPath,
                    json:json)
                
            else
            {
                continue
            }
            
            collection.items.append(item)
        }
        
        completion(
            collection,
            nil)
    }
    
    //MARK: internal
    
    func loadDocument<T:CloudItemProtocol>(
        identifier:String,
        collectionPath:String,
        completion:@escaping((T?, Error?) -> ()))
    {
        let documentReference:DocumentReference = self.reference.collection(
            collectionPath).document(identifier)
        
        documentReference.getDocument
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
            
            self?.loadDocument(
                identifier:identifier,
                collectionPath:collectionPath,
                snapshot:snapshot,
                completion:completion)
        }
    }
    
    func loadCollection<T:CloudListProtocol>(
        identifier:String,
        parentPath:String,
        completion:@escaping((T?, Error?) -> ()))
    {
        let path:String = parentPath.appendingPathComponent(component:identifier)
        let collectionReference:CollectionReference = self.reference.collection(path)
        
        collectionReference.getDocuments
        { [weak self] (querySnapshot:QuerySnapshot?, error:Error?) in
            
            guard
                
                error == nil,
                let querySnapshot:QuerySnapshot = querySnapshot
                
            else
            {
                completion(
                    nil,
                    CloudError.loadListFailed)
                
                return
            }
            
            self?.loadCollectionDocuments(
                collectionIdentifier:identifier,
                parentPath:parentPath,
                querySnapshot:querySnapshot,
                completion:completion)
        }
    }
}
