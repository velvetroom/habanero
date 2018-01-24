import Foundation

extension CloudError:LocalizedError
{
    var errorDescription:String?
    {
        get
        {
            let map:[CloudError:String] = CloudError.descriptionMap()
            let localizedDescription:String? = map[self]
            
            return localizedDescription
        }
    }
    
    //MARK: private
    
    private static func descriptionMap() -> [CloudError:String]
    {
        let map:[CloudError:String] = [
            CloudError.createFailed : String.localizedError(key:"CloudError_createFailed"),
            CloudError.loadItemFailed : String.localizedError(key:"CloudError_loadItemFailed"),
            CloudError.loadItemDataFailed : String.localizedError(key:"CloudError_loadItemDataFailed"),
            CloudError.loadListFailed : String.localizedError(key:"CloudError_loadListFailed"),
            CloudError.transactionFailed : String.localizedError(key:"CloudError_transactionFailed")]
        
        return map
    }
}
