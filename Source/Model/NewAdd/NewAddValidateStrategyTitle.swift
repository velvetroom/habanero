import Foundation

struct NewAddValidateStrategyTitle:NewAddValidateStrategyProtocol
{
    static func validate(build:Build) -> Error?
    {
        guard
        
            let title:String = build.title,
            title.isEmpty == false
        
        else
        {
            return NewAddError.validateErrorTitle
        }
        
        return nil
    }
}
