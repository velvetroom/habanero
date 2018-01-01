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
    
    func saveData(path:String, data:Data, completionHandler:@escaping((String?) -> ()))
    {
//        let childReference:StorageReference = reference.child(path)
//        childReference.putData(
//            data,
//            metadata:nil)
//        { (metaData:StorageMetadata?, error:Error?) in
//            
//            let errorString:String? = error?.localizedDescription
//            completionHandler(errorString)
//        }
    }
    
    func loadData(path:String, completionHandler:@escaping((Data?, Error?) -> ()))
    {
//        let childReference:StorageReference = reference.child(path)
//        childReference.getData(
//            maxSize:kTenMegaBytes,
//            completion:completionHandler)
    }
    
    func deleteData(path:String, completionHandler:@escaping((Error?) -> ()))
    {
//        let childReference:StorageReference = reference.child(path)
//        childReference.delete(completion:completionHandler)
    }
}
