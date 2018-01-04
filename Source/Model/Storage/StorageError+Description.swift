import Foundation

extension StorageError:LocalizedError
{
    var errorDescription:String?
    {
        get
        {
            let map:[StorageError:String] = StorageError.descriptionMap()
            let localizedDescription:String? = map[self]
            
            return localizedDescription
        }
    }
    
    //MARK: private
    
    private static func descriptionMap() -> [StorageError:String]
    {
        let map:[StorageError:String] = [
            StorageError.saveFailed : String.localizedError(key:"StorageError_saveFailed"),
            StorageError.loadFailed : String.localizedError(key:"StorageError_loadFailed"),
            StorageError.deleteFailed : String.localizedError(key:"StorageError_deleteFailed")]
        
        return map
    }
}
