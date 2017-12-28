import Foundation

extension NewAddError:LocalizedError
{
    var errorDescription:String?
    {
        get
        {
            let map:[NewAddError:String] = NewAddError.descriptionMap()
            let localizedDescription:String? = map[self]
            
            return localizedDescription
        }
    }
    
    //MARK: private
    
    private static func descriptionMap() -> [NewAddError:String]
    {
        let map:[NewAddError:String] = [
            NewAddError.invalidImageData : String.localizedError(key:"NewAddError_invalidImageData")]
        
        return map
    }
}
