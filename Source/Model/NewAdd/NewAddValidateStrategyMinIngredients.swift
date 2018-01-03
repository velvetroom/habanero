import Foundation

struct NewAddValidateStrategyMinIngredients:NewAddValidateStrategyProtocol
{
    static func validate(build:Build) -> Error?
    {
        guard
            
            let ingredientsCount:Int = build.ingredients?.count,
            ingredientsCount > 0
            
        else
        {
            return NewAddError.validateErrorMinIngredients
        }
        
        return nil
    }
}
