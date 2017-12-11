import Foundation

extension CloudError
{
    var localizedDescription:String?
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
            CloudError.createFailed : String.localizedModel(key:"CloudError_createFailed")]
        
        return map
    }
}
