import Foundation

extension Format
{
    //MARK: internal
    
    static func factoryAmount(
        recipeIngredient:RecipeIngredient,
        settings:Settings) -> String?
    {
        guard
            
            let formatter:FormatIngredientTypeProtocol.Type = Format.typeMap[recipeIngredient.amountType]
            
        else
        {
            return nil
        }
        
        let amount:String? = formatter.factoryAmount(
            recipeIngredient:recipeIngredient,
            settings:settings)
        
        return amount
    }
}

