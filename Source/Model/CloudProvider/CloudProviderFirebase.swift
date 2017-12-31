import Foundation
import Firebase

final class CloudProviderFirebase:CloudProviderProtocol
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
    
    func createDocumentAt(
        collectionPath:String,
        with documentData:[String:Any],
        completion:@escaping((String?, Error?) -> ()))
    {
        let document:DocumentReference = self.reference.collection(collectionPath).document()
        document.setData(documentData)
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
}
