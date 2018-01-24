import Foundation
import Firebase

extension CloudProviderFirebase
{
    //MARK: internal
    
    func transactionOnProperty(
        property:String,
        documentPath:String,
        with deltaValue:Int,
        completion:@escaping((Error?) -> ()))
    {
        let documentReference:DocumentReference = self.reference.document(documentPath)
        
        self.reference.runTransaction(
        { (transaction:Transaction, error:NSErrorPointer) -> Any? in
            
            let snapshot:DocumentSnapshot
            
            do
            {
                try snapshot = transaction.getDocument(documentReference)
            }
            catch let fetchError as NSError
            {
                error?.pointee = fetchError
                
                return nil
            }
            
            let currentValue:Int
            
            if let propertyValue:Int = snapshot.data()[property] as? Int
            {
                currentValue = propertyValue
            }
            else
            {
                currentValue = 0
            }
            
            let newValue:Int = currentValue + deltaValue
            
            let updatedData:[AnyHashable:Any] = [
                property:newValue]
            
            transaction.updateData(
                updatedData,
                forDocument:documentReference)
            
            return nil
        })
        { (object:Any?, error:Error?) in
            
            guard
                
                error == nil
            
            else
            {
                completion(CloudError.transactionFailed)
                
                return
            }
            
            completion(nil)
        }
    }
}
