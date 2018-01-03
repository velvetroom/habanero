import Foundation

struct NewAddValidateStrategySubtitle:NewAddValidateStrategyProtocol
{
    static func validate(build:Build) -> Error?
    {
        guard
            
            let subtitle:String = build.subtitle,
            subtitle.isEmpty == false
            
        else
        {
            return NewAddError.validateErrorSubtitle
        }
        
        return nil
    }
}
