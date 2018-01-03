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
        let minStepsAllowed:NSNumber = NSNumber(value:NewAddValidateStrategyMinSteps.Constants.minSteps)
        let messageMinSteps:String = String(
            format:String.localizedError(key:"NewAddError_validateErrorMinSteps"),
            minStepsAllowed)
        
        let map:[NewAddError:String] = [
            NewAddError.invalidImageData : String.localizedError(key:"NewAddError_invalidImageData"),
            NewAddError.validateErrorMinSteps : messageMinSteps]
        
        return map
    }
}
