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
    
    private func loadList<T:CloudListProtocol>(
        querySnapshot:QuerySnapshot,
        parentPath:String,
        completion:((T?, Error?) -> ()))
    {
        var list:T = T()
        let documents:[DocumentSnapshot] = querySnapshot.documents
        
        for document:DocumentSnapshot in documents
        {
            let identifier:String = document.documentID
            let json:[String:Any] = document.data()
            
            guard
            
                let item:T.Item = T.Item(
                    parentPath:parentPath,
                    identifier:identifier,
                    json:json)
            
            else
            {
                continue
            }
            
            list.items.append(item)
        }
        
        completion(
            list,
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
        parentPath:String,
        completion:@escaping((T?, Error?) -> ()))
    {
        let path:String = Cloud.factoryPath(
            parentPath:parentPath,
            identifier:T.identifier)
        
        let listReference:CollectionReference = self.reference.collection(path)
        
        listReference.getDocuments
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
            
            self?.loadList(
                querySnapshot:querySnapshot,
                parentPath:path,
                completion:completion)
        }
    }
}
