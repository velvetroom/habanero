import Foundation
import Firebase

extension CloudProviderFirebase
{
    //MARK: internal
    
    func transactionOnDocument(
        identifier:String,
        collectionPath:String,
        with deltaValue:Int,
        completion:@escaping((Error?) -> ()))
    {
        self.reference.runTransaction(
        { (transaction:Transaction, error:NSErrorPointer) -> Any? in
            
            let sfDocument: DocumentSnapshot
            do {
                try sfDocument = transaction.getDocument(sfReference)
            } catch let fetchError as NSError {
                errorPointer?.pointee = fetchError
                return nil
            }
            
            guard let oldPopulation = sfDocument.data()?["population"] as? Int else {
                let error = NSError(
                    domain: "AppErrorDomain",
                    code: -1,
                    userInfo: [
                        NSLocalizedDescriptionKey: "Unable to retrieve population from snapshot \(sfDocument)"
                    ]
                )
                errorPointer?.pointee = error
                return nil
            }
            
            transaction.updateData(["population": oldPopulation + 1], forDocument: sfReference)
            return nil
            
        })
        { (object:Any?, error:Error?) in
            
            completion(error)
        }
    }
}
