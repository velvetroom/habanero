import Foundation
import FirebaseStorage

final class StorageProviderFirebase:StorageProviderProtocol
{
    let reference:StorageReference
    
    init()
    {
        self.reference = FirebaseStorage.Storage.storage().reference()
    }
    
    //MARK: internal
    
    func saveData(
        data:Data,
        at path:String,
        completion:@escaping((Error?) -> ()))
    {
        let childReference:StorageReference = self.reference.child(path)
        
        childReference.putData(
            data,
            metadata:nil)
        { (metadata:StorageMetadata?, error:Error?) in
            
            guard
            
                error == nil
            
            else
            {
                completion(StorageError.saveFailed)
                
                return
            }
            
            completion(nil)
        }
    }
    
    func loadData(
        path:String,
        completion:@escaping((Data?, Error?) -> ()))
    {
        let childReference:StorageReference = self.reference.child(path)
        childReference.getData(maxSize:StorageProviderFirebase.Constants.maxFileSize)
        { (data:Data?, error:Error?) in
            
            guard
            
                error == nil
            
            else
            {
                completion(nil, StorageError.loadFailed)
                
                return
            }
            
            guard
            
                let data:Data = data
            
            else
            {
                completion(nil, StorageError.fileNotFound)
                
                return
            }
            
            completion(data, nil)
        }
    }
}
