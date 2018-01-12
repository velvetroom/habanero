import Foundation

struct FormatIngredientTypeCups:FormatIngredientTypeProtocol
{
    //MARK: private
    
    private static func factoryAmount(cups:Float) -> String?
    {
        let formatter:NumberFormatter = Format.factoryFormatter(
            decimals:FormatIngredientTypeCups.Constants.maxDecimals)
        formatter.positiveSuffix = String.localizedModel(key:"FormatIngredientTypeCups_suffix")
        
        let number:NSNumber = cups as NSNumber
        let amount:String? = formatter.string(from:number)
        
        return amount
    }
    
    //MARK: internal
    
    static func factoryAmount(
        buildIngredient:BuildIngredient,
        settings:Settings) -> String?
    {
        guard
        
            let buildIngredient:BuildIngredientCups = buildIngredient as? BuildIngredientCups
        
        else
        {
            return nil
        }
        
        let amount:String? = FormatIngredientTypeCups.factoryAmount(cups:buildIngredient.cups)
        
        return amount
    }
    
    static func factoryAmount(
        recipeIngredient:RecipeIngredient,
        settings:Settings) -> String?
    {
        guard
            
            let recipeIngredient:RecipeIngredientCups = recipeIngredient as? RecipeIngredientCups
            
        else
        {
            return nil
        }
        
        let amount:String? = FormatIngredientTypeCups.factoryAmount(cups:recipeIngredient.cups)
        
        return amount
    }
}
