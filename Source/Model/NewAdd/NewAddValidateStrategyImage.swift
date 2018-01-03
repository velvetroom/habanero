import Foundation

struct NewAddValidateStrategyImage:NewAddValidateStrategyProtocol
{
    static func validate(build:Build) -> Error?
    {
        guard
            
            build.imageIdentifier != nil
            
        else
        {
            return NewAddError.validateErrorImage
        }
        
        return nil
    }
}
