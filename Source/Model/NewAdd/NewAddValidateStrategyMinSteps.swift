import Foundation

struct NewAddValidateStrategyMinSteps:NewAddValidateStrategyProtocol
{
    static func validate(build:Build) -> Error?
    {
        guard
        
            let stepCount:Int = build.steps?.count,
            stepCount >= NewAddValidateStrategyMinSteps.Constants.minSteps
        
        else
        {
            return NewAddError.validateErrorMinSteps
        }
        
        return nil
    }
}
